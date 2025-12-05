package com.edufinanciero.edufinanciero.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edufinanciero.edufinanciero.dao.UsuarioDao;
import com.edufinanciero.edufinanciero.model.Usuario;

@RestController
public class UsuarioController {
    private UsuarioDao usuarioDao;;

    @GetMapping("/getAll")
    public List<Usuario> getAll() {
        return usuarioDao.getAll();
    }
}
