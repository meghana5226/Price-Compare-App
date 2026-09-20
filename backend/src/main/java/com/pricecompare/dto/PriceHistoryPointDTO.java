package com.pricecompare.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PriceHistoryPointDTO {
    private String platformName;
    private Double totalCost;
    private String recordedAt; // ISO-8601 string
}
