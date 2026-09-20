package com.pricecompare.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * A single price snapshot for a Product on a Platform.
 * Multiple rows per (product, platform) pair represent price history over time;
 * the row with the latest `recordedAt` for a given pair is treated as the "current" price.
 */
@Entity
@Table(name = "price_entries")
@Getter
@Setter
@NoArgsConstructor
public class PriceEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "platform_id", nullable = false)
    private Platform platform;

    @Column(nullable = false)
    private Double price;

    private Double shippingCost;

    @Column(nullable = false)
    private Boolean inStock = true;

    @Column(length = 1000)
    private String productUrl;

    @Column(nullable = false)
    private LocalDateTime recordedAt;

    public Double getTotalCost() {
        double shipping = shippingCost == null ? 0.0 : shippingCost;
        return Math.round((price + shipping) * 100) / 100.0;
    }
}
