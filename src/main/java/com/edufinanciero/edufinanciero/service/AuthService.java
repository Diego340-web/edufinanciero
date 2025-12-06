package com.edufinanciero.edufinanciero.service;

import com.edufinanciero.edufinanciero.dto.AuthResponse;
import com.edufinanciero.edufinanciero.dto.LoginRequest;
import com.edufinanciero.edufinanciero.dto.RegisterRequest;
import com.edufinanciero.edufinanciero.model.Usuario;
import com.edufinanciero.edufinanciero.repository.UsuarioRepository;
import com.edufinanciero.edufinanciero.security.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtil jwtUtil;

    public AuthResponse login(LoginRequest request) {
        try {
            Optional<Usuario> usuarioOpt = usuarioRepository.findByCorreo(request.getCorreo());
            
            if (usuarioOpt.isEmpty()) {
                return new AuthResponse("Credenciales incorrectas");
            }

            Usuario usuario = usuarioOpt.get();

            if (!usuario.getActivo()) {
                return new AuthResponse("Usuario inactivo");
            }

            if (!passwordEncoder.matches(request.getPassword(), usuario.getPassword())) {
                return new AuthResponse("Credenciales incorrectas");
            }

            String token = jwtUtil.generateToken(usuario.getCorreo());

            return new AuthResponse(
                token,
                usuario.getCorreo(),
                usuario.getNombre(),
                usuario.getApellido()
            );
        } catch (Exception e) {
            return new AuthResponse("Error en el inicio de sesión: " + e.getMessage());
        }
    }

    public AuthResponse register(RegisterRequest request) {
        try {
            if (usuarioRepository.existsByCorreo(request.getCorreo())) {
                return new AuthResponse("El correo ya está registrado");
            }

            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(request.getNombre());
            nuevoUsuario.setApellido(request.getApellido());
            nuevoUsuario.setCorreo(request.getCorreo());
            nuevoUsuario.setPassword(passwordEncoder.encode(request.getPassword()));
            nuevoUsuario.setActivo(true);

            usuarioRepository.save(nuevoUsuario);

            String token = jwtUtil.generateToken(nuevoUsuario.getCorreo());

            return new AuthResponse(
                token,
                nuevoUsuario.getCorreo(),
                nuevoUsuario.getNombre(),
                nuevoUsuario.getApellido()
            );
        } catch (Exception e) {
            return new AuthResponse("Error en el registro: " + e.getMessage());
        }
    }
}
