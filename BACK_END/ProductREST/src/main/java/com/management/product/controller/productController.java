package com.management.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.management.product.model.product;
import com.management.product.service.productService;

import java.util.List;

@RestController
public class productController {
    @Autowired
    private productService service;

    @GetMapping("/products")
    public List<product> listProducts(){
        return service.listProducts();
    }

    @GetMapping("/products/{id}")
    public ResponseEntity<product> getProduct(@PathVariable Integer id) {
        try {
            product Product = service.getProduct(id);
            return new ResponseEntity<product>(Product, HttpStatus.OK);
        }catch (Exception exception) {
            return new ResponseEntity<product>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/products")
    public void saveProduct(@RequestBody product Product) {
        service.saveProduct(Product);
    }

    @PutMapping("/products/{id}")
    public ResponseEntity<?> updateProduct(@RequestBody product Product, @PathVariable Integer id) {
        try {
            product productExisting = service.getProduct(id);

            productExisting.setName(Product.getName());
            productExisting.setPrice(Product.getPrice());

            service.saveProduct(Product);
            return new ResponseEntity<product>(HttpStatus.OK);
        }catch (Exception exception) {
            return new ResponseEntity<product>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/products/{id}")
    public void deleteProduct(@PathVariable Integer id) {
        service.deleteProduct(id);
    }
}
