package com.edufinanciero.edufinanciero.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edufinanciero.edufinanciero.model.Usuario;
import com.edufinanciero.edufinanciero.repository.UsuarioRepository;

@Service
public class UsuarioDao {
    
    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> getAll() {
        return usuarioRepository.findAll();
    }
    
    public Usuario getById(Long id) {
        return usuarioRepository.findById(id).orElse(null);
    }
    
    public Usuario save(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }
    
    public void delete(Long id) {
        usuarioRepository.deleteById(id);
    }
}
