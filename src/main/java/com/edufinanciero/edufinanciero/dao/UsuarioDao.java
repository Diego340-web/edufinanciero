package com.edufinanciero.edufinanciero.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.edufinanciero.edufinanciero.model.Usuario;

public class UsuarioDao {
    private JdbcTemplate jdbcTemplate;

    public List<Usuario> getAll() {
        String sql = "SELECT * FROM usuario";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Usuario.class));
    }
}
