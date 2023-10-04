package com.example.firstProject;

import com.example.domain.person;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;
import java.util.List;

@Controller
@Slf4j
public class controladorRest {

    @GetMapping("/")
    public String firstWorld (Model model) {
        String message = "Hola, esto es programación en spring boot";

        person persona = new person();

        persona.setName("Evelyn");
        persona.setLastName("Mojica");
        persona.setPhone("310894039");
        persona.setEmail("evelyn@gmail.com");
        persona.setAge("19 years");

        person persona2 = new person();

        persona2.setName("Tania");
        persona2.setLastName("Millan");
        persona2.setPhone("31290847590");
        persona2.setEmail("tania@gmail.com");
        persona2.setAge("25 years");

        List personas = Arrays.asList(persona, persona2);

        log.info("ejecutando el controlador MVC");
        model.addAttribute("message", message);
        model.addAttribute("persona", persona);
        model.addAttribute("personas", personas);
        return "index";
    }

}
