package com.pricecompare.controller;

import com.pricecompare.dto.PriceHistoryPointDTO;
import com.pricecompare.dto.ProductComparisonDTO;
import com.pricecompare.service.ProductService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public List<ProductComparisonDTO> getAll() {
        return productService.getAllComparisons();
    }

    @GetMapping("/search")
    public List<ProductComparisonDTO> search(@RequestParam("query") String query) {
        return productService.searchComparisons(query);
    }

    @GetMapping("/{id}")
    public ProductComparisonDTO getOne(@PathVariable Long id) {
        return productService.getComparisonForProduct(id);
    }

    @GetMapping("/{id}/history")
    public List<PriceHistoryPointDTO> getHistory(@PathVariable Long id) {
        return productService.getPriceHistory(id);
    }
}
