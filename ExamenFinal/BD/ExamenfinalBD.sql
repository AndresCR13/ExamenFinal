
create DATABASE examenfinal
go
use examenfinal

create table Usuario
(
	IDUsuario int identity primary key,
	Usuario varchar(50),
	Contraseña varchar(50),
	Nombre varchar(100)
)

CREATE TABLE Agentes (
    ID_Agente INT identity PRIMARY KEY,
    Nombre VARCHAR(50),
	Email VARCHAR(50),
	Telefono VARCHAR(20)
)
go

CREATE TABLE Clientes (
    ID_Cliente INT identity primary key ,
    Nombre VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);
go
CREATE TABLE Casas (
    ID INT IDENTITY PRIMARY KEY,
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Precio DECIMAL(10, 2)
);
go
CREATE TABLE Ventas (
    ID INT identity PRIMARY KEY,
    ID_Agente INT,
    ID_Cliente INT,
    ID_Casa INT,
    Fecha DATE,
    FOREIGN KEY (ID_Agente) REFERENCES Agentes(ID_Agente),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Casa) REFERENCES Casas(ID)
);

INSERT INTO Agentes (Nombre, Email, Telefono) VALUES
('Juan Pérez', 'juan@example.com', '123-456-7890'),
('María López', 'maria@example.com', '987-654-3210'),
('Carlos González', 'carlos@example.com', '456-789-0123');

INSERT INTO Clientes (Nombre, Email, Telefono) VALUES
('Laura Martínez', 'laura@example.com', '111-222-3333'),
('Pedro Rodríguez', 'pedro@example.com', '444-555-6666'),
('Ana García', 'ana@example.com', '777-888-9999');

INSERT INTO Casas (Direccion, Ciudad, Precio) VALUES
('Calle 123', 'Madrid', 250000.00),
('Avenida 456', 'Barcelona', 300000.00),
('Calle 789', 'Valencia', 200000.00);

INSERT INTO Ventas (ID_Agente, ID_Cliente, ID_Casa, Fecha) VALUES
(1, 2, 1, '2024-04-01'),
(2, 3, 2, '2024-04-03'),
(3, 1, 3, '2024-04-05');

INSERT INTO Usuario(Usuario,Contraseña,Nombre) values
('AndresS','123','Andres Serrano'),
('Diana','12345','Diana Vargas'),
('Elena','12345','Elena Jimenez')


select * from agentes
select * from casas
select * from Clientes
select * from ventas
select * from Usuario

CREATE PROCEDURE GestionarAgentes
    @accion NVARCHAR(10),
    @agente_id INT = NULL,
    @agente_nombre NVARCHAR(50) = NULL,
    @agente_email NVARCHAR(100) = NULL,
    @agente_telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Agentes (Nombre, Email, Telefono) VALUES (@agente_nombre, @agente_email, @agente_telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Agentes WHERE ID_Agente = @agente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Agentes SET 
            Nombre = @agente_nombre,
            Email = @agente_email,
            Telefono = @agente_telefono
        WHERE ID_Agente = @agente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Agentes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END

CREATE PROCEDURE ConsultarUsuario
AS
	BEGIN
		SELECT IDUsuario,Usuario,Contraseña FROM Usuario
	END
	

	CREATE PROCEDURE ConsultaUsuarioFiltro
	@IDUsuario INT
	AS
		BEGIN
			SELECT IDUsuario,Usuario,Contraseña FROM Usuario	WHERE IDUsuario	= @IDUsuario
		END

	CREATE PROCEDURE AgregarUsuario
	@Usuario varchar(50),
	@Contraseña VARCHAR(50)
	AS
		BEGIN
			INSERT INTO Usuario(Usuario,Contraseña) VALUES (@Usuario,@Contraseña)
		END
		
	CREATE PROCEDURE ValidarUsuario
		@Usuario VARCHAR(50),
		@Contraseña VARCHAR(50)
		AS
			BEGIN
				SELECT IdUsuario,Usuario,Contraseña FROM Usuario WHERE Usuario = @Usuario AND Contraseña = @Contraseña
			END
	

EXEC GestionarAgentes 'agregar', NULL, 'Nuevo Agente', 'nuevo@example.com', '123-456-7890';
EXEC GestionarAgentes 'borrar', 4;
EXEC GestionarAgentes 'modificar', 1, 'Juan Pérez Modificado';
EXEC GestionarAgentes 'consultar';

CREATE TABLE Clientes (
    ID_Cliente INT identity primary key ,
    Nombre VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);


CREATE PROCEDURE GestionarClientes
    @accion NVARCHAR(10),
    @cliente_id INT = NULL,
    @cliente_nombre NVARCHAR(50) = NULL,
    @cliente_email NVARCHAR(100) = NULL,
    @cliente_telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Clientes(Nombre, Email, Telefono) VALUES ( @cliente_nombre, @cliente_email,  @cliente_telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Clientes WHERE ID_Cliente =  @cliente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Clientes SET 
            Nombre = @cliente_nombre,
            Email =  @cliente_email ,
            Telefono = @cliente_telefono
        WHERE  ID_Cliente = @cliente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT * FROM Clientes;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END

CREATE PROCEDURE ConsultarUsuario
AS
	BEGIN
		SELECT IDUsuario,Usuario,Contraseña FROM Usuario
	END