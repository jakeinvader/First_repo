package com.example.firstCrud.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.example.firstCrud.model.Persona;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.firstCrud.repository.personaRepository;
@Service
public class personaService {

    @Autowired
    private personaRepository personaRepositorY;

    public Persona create (Persona persona) {
        return personaRepositorY.save(persona);
    }

    public List<Persona> getAllPersonas (){
        return personaRepositorY.findAll();
    }

    public void delete (Persona persona) {
        personaRepositorY.delete(persona);
    }

    public Optional<Persona> findById (Long id) {
        return personaRepositorY.findById(id);
    }
}
