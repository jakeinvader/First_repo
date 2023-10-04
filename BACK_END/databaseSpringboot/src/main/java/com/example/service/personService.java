package com.example.service;

import com.example.domain.Persona;

import java.util.List;

public interface personService {

    public List<Persona> listPersonas();

    public void save (Persona persona);

    public void delete (Persona persona);

    public Persona localizePerson (Persona persona);
}
