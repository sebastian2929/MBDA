/* CICLO 1 */

CREATE Table usuarios(
    ID VARCHAR(5) NOT NULL,
    fechaRegistro TIMESTAMP NOT NULL,
    correoElectronico VARCHAR(50) NOT NULL
);

CREATE Table numeroscontactos(
    ID VARCHAR(5) NOT NULL,
    Contacto NUMERIC(10) NOT NULL
);

CREATE Table personasnaturales(
    ID VARCHAR(5) NOT NULL,
    tipoDocumento VARCHAR(30) NOT NULL,
    numeroDocumento VARCHAR(30)  NOT NULL,
    nombres VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    nacionalidad VARCHAR(10) NOT NULL
);

CREATE Table empresas(
    ID VARCHAR(5) NOT NULL,
    nit VARCHAR(10) NOT NULL,
    razonSocial VARCHAR(100) NOT NULL,
    persona VARCHAR(10) NOT NULL
);

CREATE TABLE ofertas(
    numero NUMBER(9) NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    tipovivienda VARCHAR(1) NOT NULL,
    tamaño NUMBER(3) NOT NULL,
    habitada VARCHAR(1) NOT NULL,
    costo NUMBER(9) NOT NULL,
    proyectovivienda VARCHAR(1) NOT NULL,
    anexos VARCHAR(50),
    usuario VARCHAR(5) NOT NULL,
    ubicacion VARCHAR(11) NOT NULL
);

CREATE TABLE ofertas_fotografias(
    nombre VARCHAR(15) NOT NULL,
    numero NUMBER(9) NOT NULL
);

CREATE TABLE fotografias(
    nombref VARCHAR(15) NOT NULL,
    ruta VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE opcionescreditos(
    numero NUMBER(9) NOT NULL,
    plazo NUMBER NOT NULL,
    valormensual NUMBER(9) NOT NULL
);

CREATE TABLE ubicaciones(
    codigo VARCHAR(11) NOT NULL,
    latitud NUMBER(3) NOT NULL,
    longitud NUMBER(3) NOT NULL,
    ciudad VARCHAR(10) NOT NULL,
    zona VARCHAR(1) NOT NULL,
    barrio VARCHAR(10) NOT NULL
);

CREATE TABLE interesesen(
    ubicacion VARCHAR(11) NOT NULL,
    demanda NUMBER(9) NOT NULL,
    nivel VARCHAR(1) NOT NULL
);

CREATE TABLE demanda(
    numero NUMBER(9) NOT NULL,
    fecha DATE NOT NULL,
    tipoVivienda VARCHAR(1) NOT NULL,
    maxCompra NUMBER(9) NOT NULL,
    usuario VARCHAR(5) NOT NULL
);

CREATE TABLE origenesfondos(
    valor NUMBER(9) NOT NULL,
    credito VARCHAR(1) NOT NULL,
    estaaprobado VARCHAR(1),
    entidadbancaria VARCHAR(50),
    demanda NUMBER(9) NOT NULL
);
/*
"CRUD:--------------------"
    ATRIBUTOS
    TUPLAS "Todas las demandas corresponden a un unico pago en efectivo" */
    ALTER TABLE ORIGENESFONDOS ADD CONSTRAINT UK_Pagos_Efectivo UNIQUE(credito);
/*  TUPLASOK         */
    INSERT INTO origenesfondos VALUES(00001,'t','t','Bancolombia',98765432);
/*  TUPLASNOOK       */
    INSERT INTO origenesfondos(valor,credito,estaaprobado,entidadbancaria,demanda) VALUES(12345678,'t','t','Bancolombia',98765432);

/*----------------------------------------------------------------
Disparadores */
/* Las demandas no se pueden eliminar */

    CREATE TRIGGER TR_NO_ELIMINAR
    BEFORE DELETE
    ON DEMANDA
    FOR EACH ROW
    BEGIN NO_ERROR(-5,'no se puede eliminar');

/*Las descripciones no se pueden eliminar*/ 
    CREATE OR REPLACE TRIGGER TR_NO_ELIMINAR_DESCRIPCION
    BEFORE DELETE
    ON OFERTA
    FOR EACH ROW
    BEGIN NO_ERROR(-5,'no se puede eliminar')

/*DISPARADORNOOK*/
    DROP TABLE DEMANDA CASCADE CONSTRAINT PURGE;
    DROP TABLE OFERTA CASCADE CONSTRAINT PURGE;

/*Xdisparadores*/
    DROP TRIGGER TR_NO_ELIMINAR
    DROP TRIGGER TR_NO_ELIMINAR_DESCRIPCION

/*----------------------------------------------------------------*/
    /*PROTEGIENDO*/
    /*Ciclo 1 PRIMARIAS*/
ALTER TABLE usuarios ADD CONSTRAINT PK_usuario PRIMARY KEY(ID);
ALTER TABLE numeroscontactos ADD CONSTRAINT PK_numeroscontactos PRIMARY KEY(ID);
ALTER TABLE personasnaturales ADD CONSTRAINT PK_personasnaturales PRIMARY KEY(ID);
ALTER TABLE empresas ADD CONSTRAINT PK_empresas PRIMARY KEY(ID);
ALTER TABLE ofertas ADD CONSTRAINT PK_ofertas PRIMARY KEY(numero);
ALTER TABLE ofertas_fotografias ADD CONSTRAINT PK_ofertas_fotografias PRIMARY KEY(nombre,numero);
ALTER TABLE fotografias ADD CONSTRAINT PK_Product PRIMARY KEY(nombref);
ALTER TABLE opcionescreditos ADD CONSTRAINT PK_fotografias PRIMARY KEY(numero);
ALTER TABLE ubicaciones ADD CONSTRAINT PK_ubicaciones PRIMARY KEY(codigo);
ALTER TABLE interesesen ADD CONSTRAINT PK_interesesen PRIMARY KEY(ubicacion,demanda);
ALTER TABLE demanda ADD CONSTRAINT PK_demanda PRIMARY KEY(numero);
    
    /*Ciclo 1 Unicas*/
ALTER TABLE personasnaturales ADD CONSTRAINT UK_personasnaturales UNIQUE (tipoDocumento);
ALTER TABLE personasnaturales ADD CONSTRAINT UK_personasnaturales_num UNIQUE (numeroDocumento);
ALTER TABLE empresas ADD CONSTRAINT UK_empresas UNIQUE (nit);

    /*Ciclo 1 Foraneas*/

ALTER TABLE numeroscontactos 
    ADD CONSTRAINT FK_numeroscontactos
    FOREIGN KEY(ID) 
    REFERENCES usuarios(ID);

ALTER TABLE personasnaturales 
    ADD CONSTRAINT FK_personasnaturales
    FOREIGN KEY(ID) 
    REFERENCES usuarios(ID);

ALTER TABLE empresas 
    ADD CONSTRAINT FK_empresas
    FOREIGN KEY(ID) 
    REFERENCES usuarios(ID);

ALTER TABLE ofertas 
    ADD CONSTRAINT FK_ofertas
    FOREIGN KEY(usuario) 
    REFERENCES usuarios(ID);
    
ALTER TABLE demanda
    ADD CONSTRAINT FK_demanda
    FOREIGN KEY(usuario) 
    REFERENCES usuarios(ID);

ALTER TABLE ofertas
    ADD CONSTRAINT FK_ofertas_u
    FOREIGN KEY(ubicacion) 
    REFERENCES ubicaciones(codigo);

ALTER TABLE empresas 
    ADD CONSTRAINT FK_empresas_p
    FOREIGN KEY(persona) 
    REFERENCES personasnaturales(ID);
    
ALTER TABLE ofertas_fotografias 
    ADD CONSTRAINT FK_ofertas_fotografias
    FOREIGN KEY(nombre) 
    REFERENCES fotografias(nombref);
    
ALTER TABLE ofertas_fotografias 
    ADD CONSTRAINT FK_ofertas_fotografias_num
    FOREIGN KEY(numero) 
    REFERENCES ofertas(numero);
    
ALTER TABLE opcionescreditos 
    ADD CONSTRAINT FK_opcionescreditos
    FOREIGN KEY(numero) 
    REFERENCES ofertas(numero);

ALTER TABLE interesesen 
    ADD CONSTRAINT FK_interesesen
    FOREIGN KEY(ubicacion) 
    REFERENCES ubicaciones(codigo);

ALTER TABLE interesesen 
    ADD CONSTRAINT FK_interesesen_num
    FOREIGN KEY(demanda) 
    REFERENCES demanda(numero);
    
ALTER TABLE origenesfondos 
    ADD CONSTRAINT FK_origenesfondos
    FOREIGN KEY(demanda) 
    REFERENCES demanda(numero);
    
/*-----------------------------------------------------------------------------------------*/
/* POBLANDO */
    /*PoblarOK(1)*/
        /*Usuarios*/
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(1,to_date('2019-DEC-20 13:35','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'sebastian@gmail.com');
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(2,to_date('2018-DEC-01 8:12','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'jose@gmail.com');
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(3,to_date('2018-DEC-14 19:47','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'pablo@gmail.com');
        /*Oferta*/
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(001,to_date('01-05-2022', 'dd-mm-yyyy'),'una apartamento de 1 baño','a',100,'t',10000,'f','anexos',2,'10');
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(002,to_date('18-06-2021', 'dd-mm-yyyy'),'una casa de 3 baño','c',100,'t',2000000,'f','anexos',2,'10');
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(003,to_date('29-03-2022', 'dd-mm-yyyy'),'una casa de 2 baño','c',100,'f',100000,'f','anexos',2,'10');

        /*Ubicacion*/
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000001',30,40,'Bogota','N','mirandela');
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000002',90,20,'Medellin','S','Poblado');
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000003',50,10,'Bogota','O','Chapinero');
        /*Demanda*/
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('100',to_date('01-05-2022', 'dd-mm-yyyy'),'c',10000000,1);
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('200',to_date('08-06-2021', 'dd-mm-yyyy'),'c',99999900,2);
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('300',to_date('29-04-2022', 'dd-mm-yyyy'),'a',999999999,3);

    /* Poblar(2 y 3) */
    
    /*2*/
--La fecha no esta bien 
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(2,to_date('2018-DEC-01','YYYY-MON-DD'),'jose@gmail.com');
--La ubicacion no cumple con la longitud establecida
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usuario,ubicacion) VALUES(1000000000,to_date('01-05-2022', 'dd-mm-yyyy'),'una apartamento de 1 baño','a',100,'t',10000,'f','anexos',2,'10');
--Inserta un valor null cuando este tiene que existir
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES('00000000003',50,10,'Bogota',NULL,'Chapinero');
--Mala insercion de la fecha
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(1,to_date('2019-DEC-32 13:35','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'sebastian@gmail.com');
--Se agrega un null cuando no se puede ademas de poner una cadena mas larga de la permitida
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(003,to_date('29-03-2021', 'dd-mm-yyyy'),NULL,'casa',100,'f',100000,'f','anexos',2,'10');

    /*3*/
--En este no existe el ID
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(to_date('2019-DEC-20 13:35','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'sebastianB@gmail.com');
--No tiene correo
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(3,to_date('2018-DEC-14 19:47','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'));
--Le falta tener un barrio
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000003',50,10,'Bogota','Centro');
--No se sabe si esta habitada por un error en el dato
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(3,to_date('29-04-2022', 'dd-mm-yyyy'),'apartamento 1 habitaciones',1,'a',750000.0,'t','0','3','00000000001');
--No tiene dueño 
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('2000000000',to_date('08-06-2021', 'dd-mm-yyyy'),'casa',500000000.0);

    /*CONSULTADO*/
SELECT nombres, apellidos
FROM personasnaturales
JOIN usuarios ON personasnaturales.ID = usuarios.ID
JOIN ofertas ON usuarios.ID = ofertas.usuario
WHERE costo > 500000.0;

/*Consultar el valor de los origenes de fondo*/
SELECT valor
FROM origenesfondos
WHERE valor > 300000.0;

    /* XPoblar */
DELETE FROM usuarios;
DELETE FROM numeroscontactos;
DELETE FROM personasnaturales;
DELETE FROM empresas;
DELETE FROM ofertas;
DELETE FROM ofertas_fotografias;
DELETE FROM fotografias;
DELETE FROM opcionescreditos;
DELETE FROM ubicaciones;
DELETE FROM interesesen;
DELETE FROM demanda;
DELETE FROM origenesfondos;

    /*XTable*/
    /*Borra todas las tablas*/
DROP TABLE DEMANDA CASCADE CONSTRAINT PURGE;
DROP TABLE EMPRESAS CASCADE CONSTRAINT PURGE;
DROP TABLE FOTOGRAFIAS CASCADE CONSTRAINT PURGE;
DROP TABLE INTERESESEN CASCADE CONSTRAINT PURGE;
DROP TABLE NUMEROSCONTACTOS CASCADE CONSTRAINT PURGE;
DROP TABLE OFERTAS CASCADE CONSTRAINT PURGE;
DROP TABLE OFERTAS_FOTOGRAFIAS CASCADE CONSTRAINT PURGE;
DROP TABLE OPCIONESCREDITOS CASCADE CONSTRAINT PURGE;
DROP TABLE ORIGENESFONDOS CASCADE CONSTRAINT PURGE;
DROP TABLE PERSONASNATURALES CASCADE CONSTRAINT PURGE;
DROP TABLE UBICACIONES CASCADE CONSTRAINT PURGE;
DROP TABLE USUARIOS CASCADE CONSTRAINT PURGE;