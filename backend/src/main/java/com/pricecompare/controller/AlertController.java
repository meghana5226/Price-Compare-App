package com.pricecompare.controller;

import com.pricecompare.model.PriceAlert;
import com.pricecompare.service.AlertService;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/alerts")
public class AlertController {

    private final AlertService alertService;

    public AlertController(AlertService alertService) {
        this.alertService = alertService;
    }

    @PostMapping
    public PriceAlert create(@RequestBody CreateAlertRequest request) {
        return alertService.createAlert(request.getProductId(), request.getEmail(), request.getTargetPrice());
    }

    @Getter
    @Setter
    public static class CreateAlertRequest {
        @NotNull
        private Long productId;
        @Email
        private String email;
        @NotNull
        private Double targetPrice;
    }
}
