package com.proyecto.cstore.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.proyecto.cstore.model.user;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
public class userService {

    private final ObjectMapper objectMapper;
    private final Path dataPath;

    public userService() throws IOException {
        this.objectMapper = new ObjectMapper();
        // Crear el directorio data si no existe
        this.dataPath = Paths.get("data");
        if (!Files.exists(dataPath)) {
            Files.createDirectories(dataPath);
        }
    }

    private File getJsonFile() throws IOException {
        Path jsonPath = dataPath.resolve("users.json");
        if (!Files.exists(jsonPath)) {
            // Si el archivo no existe, créalo con una lista vacía
            Files.write(jsonPath, "[]".getBytes());
        }
        return jsonPath.toFile();
    }

    public List<user> getAllUsers() throws IOException {
        File file = getJsonFile();
        if (file.length() == 0) {
            return new ArrayList<>();
        }
        return objectMapper.readValue(file, new TypeReference<List<user>>() {});
    }

    public user getUserById(Long id) throws IOException {
        List<user> users = getAllUsers();
        return users.stream()
                .filter(u -> u.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public user crearUser(user newUser) throws IOException {
        List<user> users = getAllUsers();

        // Asignar un nuevo ID
        Long newId = users.isEmpty() ? 1L :
                users.stream()
                        .mapToLong(user::getId)
                        .max()
                        .getAsLong() + 1;
        newUser.setId(newId);

        users.add(newUser);
        saveUsers(users);
        return newUser;
    }

    public user actualizarUser(Long id, user updatedUser) throws IOException {
        List<user> users = getAllUsers();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getId().equals(id)) {
                updatedUser.setId(id);
                users.set(i, updatedUser);
                saveUsers(users);
                return updatedUser;
            }
        }
        return null;
    }

    public user validateUser(String email, String password) throws IOException {
        List<user> users = getAllUsers();
        return users.stream()
                .filter(u -> u.getEmail().equals(email) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }

    private void saveUsers(List<user> users) throws IOException {
        objectMapper.writeValue(getJsonFile(), users);
    }
}