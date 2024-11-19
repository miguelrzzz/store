package com.proyecto.cstore.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proyecto.cstore.model.LoginRequest;
import com.proyecto.cstore.model.user;
import com.proyecto.cstore.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("users")
@CrossOrigin(origins = "http://loaclhost:3000")
public class userController {
//    Ponemos en privado un objeto de la clase userservice
//    para acceder a sus metodos:)
    @Autowired
    private userService service;

    private static final String USER_FILE = "users.json";
    private final ObjectMapper objectMapper = new ObjectMapper();

    @GetMapping
    public ResponseEntity<List<user>> getAllUsers() throws IOException {
        List<user> usarios = service.getAllUsers();
        return ResponseEntity.ok(usarios);
    }
    @GetMapping("/{id}")
    public ResponseEntity<user> getUserById(@PathVariable Long id) throws IOException {
        user usuario = service.getUserById(id);
        if(usuario != null){
            return ResponseEntity.ok(usuario);
        }else{
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
    @PostMapping
    public ResponseEntity<user> createUser(@RequestBody user user) throws IOException {
        user nuevo = service.crearUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
    }
    @PutMapping("/{id}")
    public ResponseEntity<user> updateUser(@PathVariable Long id, @RequestBody user user) throws IOException {
        user nuevo = service.actualizarUser(id,user);
        if(nuevo != null){
            return ResponseEntity.ok(nuevo);
        }else{
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }


    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) throws IOException {
        try {
            user usuario = service.validateUser(loginRequest.getEmail(), loginRequest.getPassword());
            if (usuario != null) {
                // Si el usuario existe y las credenciales son correctas
                return ResponseEntity.ok(usuario);
            } else {
                // Si las credenciales son incorrectas
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                        .body(new ErrorResponse("Credenciales inválidas"));
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse("Error en el servidor"));
        }
    }
    static class ErrorResponse {
        private String message;

        // Constructor
        public ErrorResponse() {
        }

        public ErrorResponse(String message) {
            this.message = message;
        }

        // Getters y Setters
        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }


}
