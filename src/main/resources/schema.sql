
CREATE DATABASE IF NOT EXISTS db_edufinanciero;
USE db_edufinanciero;

-- Table: usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(50) DEFAULT 'USER',
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_correo (correo),
    INDEX idx_activo (activo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert a default admin user (password: admin123)
INSERT INTO usuarios (nombre, apellido, correo, password, rol) 
VALUES ('Admin', 'Sistema', 'admin@edufinanciera.com', 
        '$2a$10$JM9ab0uIml8f3yY8DFUD/.zffJKR0vfkhKgDQHpFbFagdanZfKX3q', 'ADMIN')
ON DUPLICATE KEY UPDATE correo=correo;

-- Insert a test user (password: test123)
INSERT INTO usuarios (nombre, apellido, correo, password, rol) 
VALUES ('Usuario', 'Prueba', 'test@ejemplo.com', 
        '$2a$10$NoTEbX21/sW6SOj4iUs.euzFnw1c4mvLnIRleoMXn434BU3Bu4TVq', 'USER')
ON DUPLICATE KEY UPDATE correo=correo;
