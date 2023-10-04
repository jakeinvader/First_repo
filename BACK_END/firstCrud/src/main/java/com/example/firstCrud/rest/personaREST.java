package com.example.firstCrud.rest;

import com.example.firstCrud.model.Persona;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.firstCrud.service.personaService;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/persona")
public class personaREST {

    private personaService personaServicE;
    @PostMapping
    private ResponseEntity<Persona> guardar (@RequestBody Persona persona) {
        Persona temporal = personaServicE.create(persona);

        try {
            return ResponseEntity.created(new URI("/api/persona"+temporal.getId())).body(temporal);
        }catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping
    private ResponseEntity<List<Persona>> listAllpersona () {
        return ResponseEntity.ok(personaServicE.getAllPersonas());

    }

    @DeleteMapping
    private ResponseEntity<Void> deletePersona (@RequestBody Persona persona) {
        personaServicE.delete(persona);
        return ResponseEntity.ok().build();
    }

    @GetMapping (value = "{id}")
    private ResponseEntity<Optional<Persona>> listPersonaId (@PathVariable ("id") Long id) {
        return ResponseEntity.ok(personaServicE.findById(id));
    }
}
