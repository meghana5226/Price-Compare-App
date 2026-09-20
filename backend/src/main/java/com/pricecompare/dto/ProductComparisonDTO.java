package com.pricecompare.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class ProductComparisonDTO {
    private Long productId;
    private String name;
    private String brand;
    private String category;
    private String imageUrl;
    private Double lowestTotalPrice;
    private List<PlatformPriceDTO> platformPrices;
}
