package com.pricecompare.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PlatformPriceDTO {
    private String platformName;
    private String platformLogoUrl;
    private Double price;
    private Double shippingCost;
    private Double totalCost;
    private Boolean inStock;
    private String productUrl;
    private Boolean bestDeal;
}
