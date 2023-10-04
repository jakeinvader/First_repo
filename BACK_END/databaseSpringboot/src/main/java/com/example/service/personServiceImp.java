package com.example.service;

import com.example.dao.IpersonaDao;
import com.example.domain.Persona;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class personServiceImp implements personService {

    @Autowired
    private IpersonaDao ipersonaDao;
    @Override
    @Transactional(readOnly = true)
    public List<Persona> listPersonas() {
        return (List<Persona>) ipersonaDao.findAll();
    }

    @Override
    @Transactional
    public void save(Persona persona) {
        ipersonaDao.save(persona);
    }

    @Override
    @Transactional
    public void delete(Persona persona) {
        ipersonaDao.delete(persona);
    }

    @Override
    @Transactional(readOnly = true )
    public Persona localizePerson(Persona persona) {
        return ipersonaDao.findById(persona.getId_persona()).orElse(null);
    }
}
