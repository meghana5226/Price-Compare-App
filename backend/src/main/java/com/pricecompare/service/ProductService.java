package com.pricecompare.service;

import com.pricecompare.dto.PlatformPriceDTO;
import com.pricecompare.dto.PriceHistoryPointDTO;
import com.pricecompare.dto.ProductComparisonDTO;
import com.pricecompare.model.PriceEntry;
import com.pricecompare.model.Product;
import com.pricecompare.repository.PriceEntryRepository;
import com.pricecompare.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final PriceEntryRepository priceEntryRepository;

    public ProductService(ProductRepository productRepository, PriceEntryRepository priceEntryRepository) {
        this.productRepository = productRepository;
        this.priceEntryRepository = priceEntryRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> searchProducts(String query) {
        return productRepository
                .findByNameContainingIgnoreCaseOrBrandContainingIgnoreCaseOrCategoryContainingIgnoreCase(
                        query, query, query);
    }

    public ProductComparisonDTO getComparisonForProduct(Long productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Product not found: " + productId));

        List<PriceEntry> latestEntries = priceEntryRepository.findLatestPricesForProduct(productId);

        double lowestTotal = latestEntries.stream()
                .mapToDouble(PriceEntry::getTotalCost)
                .min()
                .orElse(0.0);

        List<PlatformPriceDTO> platformPrices = latestEntries.stream()
                .sorted(Comparator.comparingDouble(PriceEntry::getTotalCost))
                .map(pe -> new PlatformPriceDTO(
                        pe.getPlatform().getName(),
                        pe.getPlatform().getLogoUrl(),
                        pe.getPrice(),
                        pe.getShippingCost(),
                        pe.getTotalCost(),
                        pe.getInStock(),
                        pe.getProductUrl(),
                        pe.getTotalCost() == lowestTotal
                ))
                .collect(Collectors.toList());

        return new ProductComparisonDTO(
                product.getId(),
                product.getName(),
                product.getBrand(),
                product.getCategory(),
                product.getImageUrl(),
                lowestTotal,
                platformPrices
        );
    }

    public List<ProductComparisonDTO> getAllComparisons() {
        return productRepository.findAll().stream()
                .map(p -> getComparisonForProduct(p.getId()))
                .collect(Collectors.toList());
    }

    public List<ProductComparisonDTO> searchComparisons(String query) {
        return searchProducts(query).stream()
                .map(p -> getComparisonForProduct(p.getId()))
                .collect(Collectors.toList());
    }

    public List<PriceHistoryPointDTO> getPriceHistory(Long productId) {
        DateTimeFormatter fmt = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        return priceEntryRepository.findByProductIdOrderByRecordedAtAsc(productId).stream()
                .map(pe -> new PriceHistoryPointDTO(
                        pe.getPlatform().getName(),
                        pe.getTotalCost(),
                        pe.getRecordedAt().format(fmt)
                ))
                .collect(Collectors.toList());
    }
}
