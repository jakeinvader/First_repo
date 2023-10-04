package com.example.firstCrud.repository;

import com.example.firstCrud.model.Persona;
import org.springframework.data.jpa.repository.JpaRepository;

public interface personaRepository extends JpaRepository<Persona, Long> {
}
