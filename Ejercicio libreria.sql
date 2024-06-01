-- Ejercicio practico: Sistema de Gestión de una Libreria

-- Parte 1: Creación base de datos y esquemas

CREATE DATABASE Libreria;

CREATE SCHEMA CATALOGO;
CREATE SCHEMA VENTAS

-- Parte 2: Creación de tablas

-- Creación tablas para el esquema "CATALOGO"


-- Tabla de autores
CREATE TABLE CATALOGO.AUTORES
(
	AUTOR_ID INT IDENTITY (1,1) NOT NULL,
	NOMBRE_AUTOR NVARCHAR (100) NOT NULL,
	APELLIDO_AUTOR NVARCHAR(100) NOT NULL
)

SELECT * FROM CATALOGO.AUTORES

-- Tabla de Categorias
CREATE TABLE CATALOGO.CATEGORIAS
(
	CATEGORIA_ID INT IDENTITY (1,1) NOT NULL,
	NOMBRE_CATEGORIA NVARCHAR (100) UNIQUE NOT NULL
)

-- Tabla de Libros
CREATE TABLE CATALOGO.LIBROS
(
	LIBROID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	TITULO INT NOT NULL,
	AUTORID INT NOT NULL,
	CATEGORIAID NVARCHAR(100) NOT NULL,
	PRECIO INT NOT NULL
)







---- Creación tablas para el esquema "VENTAS"
-- Tabla clientes
CREATE TABLE VENTAS.CLIENTES
(
	CLIENTE_ID INT PRIMARY KEY IDENTITY (1,1),
	NOMBRE_CLIENTE NVARCHAR (100) NOT NULL,
	APELLIDO_CLIENTE NVARCHAR(100) NOT NULL,
	CORREO NVARCHAR(200) UNIQUE NOT NULL
)

-- Tabla ventas

CREATE TABLE VENTAS.VENTAS_LOCAL
(
	VENTAID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	
	CLIENTEID INT NOT NULL,
	CONSTRAINT FK_CLIENTE_ID FOREIGN KEY(CLIENTEID)
	REFERENCES VENTAS.CLIENTES(CLIENTE_ID),

	FECHA_VENTA DATE NOT NULL
)



-- Tabla Detalle_Ventas
CREATE TABLE VENTAS.DETALLE_VENTAS
(
	DETALLEID INT PRIMARY KEY IDENTITY (1,1),

	VENTAID INT,
	CONSTRAINT FK_VENTA_ID FOREIGN KEY(VENTAID)
	REFERENCES VENTAS.VENTAS_LOCAL(VENTAID),

	LIBROID INT,
	CONSTRAINT FK_LIBRO_ID FOREIGN KEY(LIBROID)
	REFERENCES CATALOGO.LIBROS(LIBROID),

	CANTIDAD INT NOT NULL,
	PRECIO_VENTA INT NOT NULL
)


-- PARTE 3: ANEXION DE LAS RELACIONES


-- 1. Relación Uno a Uno: Definir una relación entre las tablas Autores y Libros para identificar al autor de cada libro. (El autor debe estar relacionado con cada libro).

ALTER TABLE CATALOGO.AUTORES
ADD CONSTRAINT PK_AUTOR_ID PRIMARY KEY(AUTOR_ID)

ALTER TABLE CATALOGO.LIBROS
ADD CONSTRAINT FK_ID_AUTOR FOREIGN KEY(AUTORID)
REFERENCES CATALOGO.AUTORES(AUTOR_ID)


-- 2. Relación Uno a Varios: Definir una relación entre Categorías y Libros, donde una categoría puede tener varios libros, pero un libro pertenece a una sola categoría. (Piensa en cómo un libro se clasifica bajo una sola categoría, pero una categoría puede tener muchos libros).

ALTER TABLE CATALOGO.CATEGORIAS
ADD CONSTRAINT PK_CATEGORIA_ID PRIMARY KEY(CATEGORIA_ID)

ALTER TABLE CATALOGO.LIBROS
ADD CONSTRAINT FK_CATEGORIA_AUTOR FOREIGN KEY(CATEGORIAID)
REFERENCES CATALOGO.CATEGORIAS(CATEGORIA_ID)


-- 3. Relación Uno a Varios: Definir una relación entre Clientes y Ventas, donde un cliente puede tener múltiples ventas, pero una venta está asociada a un solo cliente. (Considera cómo un cliente puede realizar varias compras, pero cada compra es única para un cliente).

-- CHECK

-- 4. Relación Uno a Varios: Definir una relación entre Ventas y DetalleVentas, donde una venta puede tener múltiples detalles, pero cada detalle está asociado a una sola venta. (Una venta puede incluir varios libros, pero cada detalle se refiere a un libro específico en esa venta).
-- CHECK-- 5. Relación Uno a Varios: Definir una relación entre Libros y DetalleVentas, donde un libro puede aparecer en múltiples detalles de ventas, pero cada detalle se refiere a un solo libro. (Un libro puede venderse muchas veces, pero cada detalle--se refiere a una sola venta de ese libro).-- CHECK -- PARTE 4 MODIFICACIONES-- 1. Por lo menos dos relaciones del modelo deben realizarse por fuera de la creación de la tabla.   CHECK


-- 2. Modifique por lo menos el nombre de tres columnas.
--EXEC sp_rename 'CATALOGO.AUTORES.AUTOR_ID','AUTOR_LIBRO', 'COLUMN';--EXEC sp_rename 'CATALOGO.AUTORES.NOMBRE_AUTOR_ID','NOMBRE', 'COLUMN';--EXEC sp_rename 'CATALOGO.AUTORES.APELLIDO_AUTOR','APELLIDO', 'COLUMN';-- 3. Añada dos columnas adicionales a por lo menos dos tablas.  CHECKALTER TABLE CATALOGO.AUTORES
ADD EDAD INTALTER TABLE CATALOGO.AUTORESADD GENERO VARCHAR(50)ALTER TABLE CATALOGO.AUTORES
ALTER TABLE VENTAS.CLIENTESADD GENERO_CLINTE VARCHAR(50)ALTER TABLE VENTAS.CLIENTESADD TELEFONO BIGINT