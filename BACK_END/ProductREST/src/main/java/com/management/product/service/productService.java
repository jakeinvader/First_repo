package com.management.product.service;

import com.management.product.model.product;
import com.management.product.repository.productRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class productService {
    @Autowired
    private productRepository repository;

    public List<product> listProducts() {
        return repository.findAll();
    }

    public void saveProduct(product Product) {
        repository.save(Product);
    }

    public product getProduct(Integer id) {
        return repository.findById(id).get();
    }

    public void deleteProduct(Integer id) {
        repository.deleteById(id);
    }
}
