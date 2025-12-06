
CREATE DATABASE IF NOT EXISTS db_edufinanciero;
USE db_edufinanciero;

-- Table: usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_correo (correo),
    INDEX idx_activo (activo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert test users (password: test123)
INSERT INTO usuarios (nombre, apellido, correo, password) 
VALUES ('Usuario', 'Prueba', 'test@ejemplo.com', 
        '$2a$10$NoTEbX21/sW6SOj4iUs.euzFnw1c4mvLnIRleoMXn434BU3Bu4TVq')
ON DUPLICATE KEY UPDATE correo=correo;

INSERT INTO usuarios (nombre, apellido, correo, password) 
VALUES ('Admin', 'Sistema', 'admin@edufinanciera.com', 
        '$2a$10$JM9ab0uIml8f3yY8DFUD/.zffJKR0vfkhKgDQHpFbFagdanZfKX3q')
ON DUPLICATE KEY UPDATE correo=correo;
