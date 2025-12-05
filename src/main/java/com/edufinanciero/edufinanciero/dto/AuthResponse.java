package com.edufinanciero.edufinanciero.dto;

public class AuthResponse {
    private String token;
    private String correo;
    private String nombre;
    private String apellido;
    private String rol;
    private String message;

    public AuthResponse() {
    }

    public AuthResponse(String token, String correo, String nombre, String apellido, String rol) {
        this.token = token;
        this.correo = correo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rol = rol;
    }

    public AuthResponse(String message) {
        this.message = message;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
