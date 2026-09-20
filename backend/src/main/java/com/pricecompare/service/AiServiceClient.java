package com.pricecompare.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

/**
 * Talks to the Flask AI microservice (ai-service/) which exposes:
 *   POST /match           - groups raw product-name strings from different platforms
 *                            into clusters that refer to the same underlying product.
 *   POST /predict-trend   - given a price history array, predicts whether the price
 *                            is trending up or down and estimates the next value.
 *
 * If the AI service is unreachable, callers degrade gracefully (see controller).
 */
@Service
public class AiServiceClient {

    private final RestTemplate restTemplate;

    @Value("${ai.service.base-url:http://localhost:5001}")
    private String aiServiceBaseUrl;

    public AiServiceClient(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @SuppressWarnings("unchecked")
    public Map<String, Object> matchProductNames(List<String> rawNames) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(Map.of("names", rawNames), headers);
        return restTemplate.postForObject(aiServiceBaseUrl + "/match", request, Map.class);
    }

    @SuppressWarnings("unchecked")
    public Map<String, Object> predictTrend(List<Double> history) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(Map.of("history", history), headers);
        return restTemplate.postForObject(aiServiceBaseUrl + "/predict-trend", request, Map.class);
    }
}
