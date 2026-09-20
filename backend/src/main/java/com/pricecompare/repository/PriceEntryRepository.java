package com.pricecompare.repository;

import com.pricecompare.model.PriceEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PriceEntryRepository extends JpaRepository<PriceEntry, Long> {

    // Latest price entry per platform for a given product (used for the comparison table)
    @Query("""
        SELECT pe FROM PriceEntry pe
        WHERE pe.product.id = :productId
        AND pe.recordedAt = (
            SELECT MAX(pe2.recordedAt) FROM PriceEntry pe2
            WHERE pe2.product.id = pe.product.id AND pe2.platform.id = pe.platform.id
        )
        ORDER BY (pe.price + COALESCE(pe.shippingCost, 0)) ASC
        """)
    List<PriceEntry> findLatestPricesForProduct(@Param("productId") Long productId);

    // Full chronological price history for a product (all platforms) - powers the trend chart
    List<PriceEntry> findByProductIdOrderByRecordedAtAsc(Long productId);
}
