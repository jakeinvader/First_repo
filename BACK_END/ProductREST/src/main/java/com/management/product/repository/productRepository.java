package com.management.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.management.product.model.product;

public interface productRepository extends JpaRepository<product, Integer> {

}
