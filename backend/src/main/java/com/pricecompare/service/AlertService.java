package com.pricecompare.service;

import com.pricecompare.model.PriceAlert;
import com.pricecompare.model.Product;
import com.pricecompare.repository.PriceAlertRepository;
import com.pricecompare.repository.ProductRepository;
import org.springframework.stereotype.Service;

@Service
public class AlertService {

    private final PriceAlertRepository priceAlertRepository;
    private final ProductRepository productRepository;

    public AlertService(PriceAlertRepository priceAlertRepository, ProductRepository productRepository) {
        this.priceAlertRepository = priceAlertRepository;
        this.productRepository = productRepository;
    }

    public PriceAlert createAlert(Long productId, String email, Double targetPrice) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Product not found: " + productId));

        PriceAlert alert = new PriceAlert();
        alert.setProduct(product);
        alert.setEmail(email);
        alert.setTargetPrice(targetPrice);
        alert.setActive(true);
        return priceAlertRepository.save(alert);
    }
}
