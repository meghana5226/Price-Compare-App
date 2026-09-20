package com.pricecompare.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    private String brand;

    private String category;

    @Column(length = 1000)
    private String imageUrl;

    @Column(length = 2000)
    private String description;

    public Product(String name, String brand, String category, String imageUrl, String description) {
        this.name = name;
        this.brand = brand;
        this.category = category;
        this.imageUrl = imageUrl;
        this.description = description;
    }
}
