-- Script para agregar usuarios adicionales a la base de datos
-- Ejecutar con: mysql -u root -p23010 db_edufinanciero < add-users.sql

-- Usuario 1: María González
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('María', 'González', 'maria.gonzalez@email.com', '$2a$10$z.9srqHWM1kbuBhS8sxC.eq9bcds3ZGv4t/ZdWt57sH3X4BEv9jzS', 1);
-- Password: admin123

-- Usuario 2: Juan Pérez
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('Juan', 'Pérez', 'juan.perez@email.com', '$2a$10$nS90d7zD9aSVunHIt.ZcK.gjtgvL/np66RYH.xpVXK/iSOcXnI6Oa', 1);
-- Password: test123

-- Usuario 3: Ana Martínez
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('Ana', 'Martínez', 'ana.martinez@email.com', '$2a$10$z.9srqHWM1kbuBhS8sxC.eq9bcds3ZGv4t/ZdWt57sH3X4BEv9jzS', 1);
-- Password: admin123

-- Usuario 4: Carlos Rodríguez
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', '$2a$10$nS90d7zD9aSVunHIt.ZcK.gjtgvL/np66RYH.xpVXK/iSOcXnI6Oa', 1);
-- Password: test123

-- Usuario 5: Laura Sánchez
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('Laura', 'Sánchez', 'laura.sanchez@email.com', '$2a$10$z.9srqHWM1kbuBhS8sxC.eq9bcds3ZGv4t/ZdWt57sH3X4BEv9jzS', 1);
-- Password: admin123

-- Usuario 6: Pedro López (Inactivo)
INSERT INTO usuarios (nombre, apellido, correo, password, activo) VALUES 
('Pedro', 'López', 'pedro.lopez@email.com', '$2a$10$nS90d7zD9aSVunHIt.ZcK.gjtgvL/np66RYH.xpVXK/iSOcXnI6Oa', 0);
-- Password: test123 (Usuario inactivo para probar validación)

-- Mostrar todos los usuarios
SELECT id, nombre, apellido, correo, activo, fecha_registro FROM usuarios ORDER BY id;
