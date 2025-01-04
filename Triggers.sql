-- Triggers
create database triggers1;
use triggers1;
-- creacion tabla empleados 
CREATE TABLE empleados (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Departamento VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL
);
-- creacion tabla auditoria
CREATE TABLE auditoria (
    AudID INT PRIMARY KEY AUTO_INCREMENT,
    Accion ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    EmpID INT,
    Nombre VARCHAR(100),
    Departamento VARCHAR(100),
    Salario DECIMAL(10, 2),
    Fecha DATETIME NOT NULL
);
-- Crear el trigger para auditar operaciones
-- Trigger para INSERT, UPDATE y DELETE
-- Insert
DELIMITER $$

CREATE TRIGGER after_empleados_insert
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('INSERT', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

DELIMITER ;
-- Update
DELIMITER $$

CREATE TRIGGER after_empleados_update
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('UPDATE', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END$$

DELIMITER ;
-- Delete
DELIMITER $$

CREATE TRIGGER after_empleados_delete
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('DELETE', OLD.EmpID, OLD.Nombre, OLD.Departamento, OLD.Salario, NOW());
END$$

DELIMITER ;

-- verificacion 
INSERT INTO empleados (Nombre, Departamento, Salario)
VALUES ('Carlos López', 'IT', 4000);
-- Actualizar:
UPDATE empleados 
SET Salario = 4500 
WHERE EmpID = 1;
-- Eliminar
DELETE FROM empleados 
WHERE EmpID = 1;
-- Consulta
SELECT * FROM auditoria;




