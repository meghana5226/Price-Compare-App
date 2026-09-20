package com.pricecompare.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "platforms")
@Getter
@Setter
@NoArgsConstructor
public class Platform {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    private String logoUrl;

    private Double defaultShippingCost;

    public Platform(String name, String logoUrl, Double defaultShippingCost) {
        this.name = name;
        this.logoUrl = logoUrl;
        this.defaultShippingCost = defaultShippingCost;
    }
}
