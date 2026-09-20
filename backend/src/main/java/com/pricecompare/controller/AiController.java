package com.pricecompare.controller;

import com.pricecompare.service.AiServiceClient;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.ResourceAccessException;

import java.util.List;
import java.util.Map;

/**
 * Thin proxy layer exposing the Python AI microservice's product-matching and
 * price-trend-prediction capabilities through the main Java API, so the frontend
 * only ever has to talk to one backend.
 */
@RestController
@RequestMapping("/api/ai")
public class AiController {

    private final AiServiceClient aiServiceClient;

    public AiController(AiServiceClient aiServiceClient) {
        this.aiServiceClient = aiServiceClient;
    }

    @PostMapping("/match")
    public Map<String, Object> match(@RequestBody Map<String, List<String>> body) {
        try {
            return aiServiceClient.matchProductNames(body.get("names"));
        } catch (ResourceAccessException e) {
            throw new ResponseStatusExceptionWithMessage(HttpStatus.SERVICE_UNAVAILABLE,
                    "AI matching service is not reachable. Is ai-service/app.py running on port 5001?");
        }
    }

    @PostMapping("/predict-trend")
    public Map<String, Object> predict(@RequestBody Map<String, List<Double>> body) {
        try {
            return aiServiceClient.predictTrend(body.get("history"));
        } catch (ResourceAccessException e) {
            throw new ResponseStatusExceptionWithMessage(HttpStatus.SERVICE_UNAVAILABLE,
                    "AI prediction service is not reachable. Is ai-service/app.py running on port 5001?");
        }
    }

    // Small helper so we get a clean JSON error body instead of a stack trace
    private static class ResponseStatusExceptionWithMessage extends org.springframework.web.server.ResponseStatusException {
        public ResponseStatusExceptionWithMessage(HttpStatus status, String message) {
            super(status, message);
        }
    }
}
