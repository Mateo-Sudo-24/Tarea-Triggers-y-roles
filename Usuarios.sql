-- Creacion de usuarios

-- Crear los usuarios con sus contraseñas
CREATE USER 'super_admin'@'localhost' IDENTIFIED BY 'PasswordSuperAdmin!';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'PasswordAdmin123!';
CREATE USER 'crud_user'@'localhost' IDENTIFIED BY 'PasswordCRUD123!';
CREATE USER 'cru_user'@'localhost' IDENTIFIED BY 'PasswordCRU123!';
CREATE USER 'read_only_user'@'localhost' IDENTIFIED BY 'PasswordRead123!';

-- 	Roles:
-- Super Administrador: Crear y eliminar bases de datos
GRANT CREATE, DROP ON *.* TO 'super_admin'@'localhost' WITH GRANT OPTION;

-- Administrador: Crear usuarios y procesos
GRANT CREATE USER, PROCESS ON *.* TO 'admin'@'localhost';

-- CRUD: Insertar, actualizar y eliminar datos
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'crud_user'@'localhost';

-- CRU: Insertar y actualizar, pero sin eliminar
GRANT SELECT, INSERT, UPDATE ON *.* TO 'cru_user'@'localhost';

-- Solo Lectura: Realizar consultas a las tablas
GRANT SELECT ON *.* TO 'read_only_user'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- Verificar los permisos de cada usuario
SHOW GRANTS FOR 'super_admin'@'localhost';
SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'crud_user'@'localhost';
SHOW GRANTS FOR 'cru_user'@'localhost';
SHOW GRANTS FOR 'read_only_user'@'localhost';
