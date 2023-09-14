-- Crear la base de datos
CREATE DATABASE nuxiba;

-- Usar la base de datos
USE nuxiba;

-- Crear la tabla 'usuario'
CREATE TABLE usuario (
    userId VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(100),
    paterno VARCHAR(100),
    materno VARCHAR(100)
);

-- Crear la tabla 'empleados' con una relación a la tabla 'usuarios'
CREATE TABLE empleado (
    userId VARCHAR(100) PRIMARY KEY,
    sueldo DOUBLE,
    fechaIngreso DATE,
    FOREIGN KEY (userId) REFERENCES usuario(userId)
);
