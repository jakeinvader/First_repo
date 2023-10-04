package com.example.web;

import com.example.domain.Persona;
import lombok.extern.slf4j.Slf4j;
import com.example.service.personService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Slf4j
public class ControladorREST {

    @Autowired
    private personService personService;
    @GetMapping("/")
    public String baseDatos (Model model) {

        List<Persona> personas = personService.listPersonas();

        log.info("Ejecutando controlador MVC");
        model.addAttribute("personas", personas);
        return "index";
    }

    @GetMapping("/anexar")
    public String anexar (Persona persona) {
        return "cambiar";
    }

    @PostMapping("/salvar")
    public String salvar (Persona persona) {
        personService.save(persona);
        return "redirect:/";
    }
}
