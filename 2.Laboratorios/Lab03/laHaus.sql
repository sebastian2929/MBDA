/* CICLO 1*/
    /* Tablas */
CREATE Table usuarios(
    ID VARCHAR(5) NOT NULL,
    fechaRegistro TIMESTAMP,
    correoElectronico VARCHAR(50)
);

CREATE Table numeroscontactos(
    ID VARCHAR(5) NOT NULL,
    Contacto NUMERIC(10)
);

CREATE Table personasnaturales(
    ID VARCHAR(5) NOT NULL,
    tipoDocumento VARCHAR(30),
    numeroDocumento VARCHAR(30),
    nombres VARCHAR(20),
    apellidos VARCHAR(20),
    nacionalidad VARCHAR(10)
);
CREATE Table empresas(
    ID VARCHAR(5) NOT NULL,
    nit VARCHAR(10),
    razonSocial VARCHAR(100),
    persona VARCHAR(10)
);

CREATE TABLE ofertas(
    numero VARCHAR(50) NOT NULL,
    fecha DATE,
    descripcion VARCHAR(50),
    tipovivienda VARCHAR(50),
    tamaño NUMBER(3),
    habitada VARCHAR(1),
    costo NUMBER,
    proyectovivienda VARCHAR(1),
    anexos VARCHAR(50) NOT NULL,
    usurio VARCHAR(5),
    ubicacion VARCHAR(11)
);

CREATE TABLE ofertas_fotografias(
    nombre VARCHAR(15) NOT NULL,
    numero VARCHAR(50) NOT NULL
);

CREATE TABLE fotografias(
    nombre VARCHAR(15) NOT NULL,
    ruta VARCHAR(100),
    descripcion VARCHAR(100)
);

CREATE TABLE opcionescreditos(
    numero VARCHAR(50) NOT NULL,
    plazo NUMBER,
    valormensual DECIMAL
);

CREATE TABLE ubicaciones(
    codigo VARCHAR(11) NOT NULL,
    latitud NUMBER(3),
    longitud NUMBER(3),
    ciudad VARCHAR(10),
    zona VARCHAR(10),
    barrio VARCHAR(10)
);

CREATE TABLE interesesen(
    ubicacion VARCHAR(11) NOT NULL,
    demanda VARCHAR(20) NOT NULL,
    nivel VARCHAR(20)
);

CREATE TABLE demanda(
    numero VARCHAR(10) NOT NULL,
    fecha DATE,
    tipoVivienda VARCHAR(50),
    maxCompra DECIMAL,
    usuario VARCHAR(5)
);

CREATE TABLE origenesfondos(
    valor DECIMAL,
    credito VARCHAR(1),
    estaaprobado VARCHAR(1),
    entidadbancaria VARCHAR(50),
    demanda VARCHAR(20)
);

    /*XTable*/
    /*Borra todas las tablas*/
DROP TABLE DEMANDA;
DROP TABLE EMPRESAS;
DROP TABLE FOTOGRAFIAS;
DROP TABLE INTERESESEN;
DROP TABLE NUMEROSCONTACTOS;
DROP TABLE OFERTAS;
DROP TABLE OFERTAS_FOTOGRAFIAS;
DROP TABLE OPCIONESCREDITOS;
DROP TABLE ORIGENESFONDOS;
DROP TABLE PERSONASNATURALES;
DROP TABLE UBICACIONES;
DROP TABLE USUARIOS;

    /* POBLANDO */
    /*PoblarOK(1)*/
        /*Usuarios*/
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(1,to_date('2019-DEC-20 13:35','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'sebastian@gmail.com');
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(2,to_date('2018-DEC-01 8:12','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'jose@gmail.com');
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(3,to_date('2018-DEC-14 19:47','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'),'pablo@gmail.com');
        /*Oferta*/
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(1,to_date('01-05-2022', 'dd-mm-yyyy'),'casa 2 habitaciones',2,'t',500000.0,'t','0','1','00000000001');
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(2,to_date('08-06-2021', 'dd-mm-yyyy'),'casa 3 habitaciones',3,'f',350000.6,'t','0','2','00000000002');
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(3,to_date('29-04-2022', 'dd-mm-yyyy'),'apartamento 1 habitaciones',1,'t',750000.0,'t','0','3','00000000001');
        /*Ubicacion*/
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000001',30,40,'Bogota','Norte','mirandela');
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000002',90,20,'Medellin','Sur','Poblado');
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000003',50,10,'Bogota','Centro','Chapinero');
        /*Demanda*/
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('1000000000',to_date('01-05-2022', 'dd-mm-yyyy'),'casa',200000000.0,1);
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('2000000000',to_date('08-06-2021', 'dd-mm-yyyy'),'casa',500000000.0,2);
INSERT INTO demanda(numero,fecha,tipoVivienda,maxCompra,usuario) VALUES ('3000000000',to_date('29-04-2022', 'dd-mm-yyyy'),'apartamento',100000000.0,3);

    /* Poblar(2 y 3) */
    
    /*2*/
--La fecha no esta bien 
INSERT INTO usuarios(ID,fecharegistro,correoElectronico) VALUES(2,to_date('2018-DEC-01','YYYY-MON-DD'),'jose@gmail.com');
--La ubicacion no cumple con la longitud establecida
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(2,to_date('08-06-2021', 'dd-mm-yyyy'),'casa 3 habitaciones',3,'f',350000.6,'t','0','2','000000002');
--El barrio no existe en esa ciudad
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00000000001',30,40,'Bogota','Norte','algaratres');
--El codigo no existe
INSERT INTO ubicaciones(codigo,latitud,longitud,ciudad,zona,barrio) VALUES ('00006',30,40,'Bogota','Norte','mirandela');
--La fecha aun no ha pasado
INSERT INTO ofertas(numero,fecha,descripcion,tipovivienda,tamaño,habitada,costo,proyectovivienda,anexos,usurio,ubicacion) VALUES(3,to_date('29-04-2024', 'dd-mm-yyyy'),'apartamento 1 habitaciones',1,'t',750000.0,'t','0','3','00000000001');

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

    /*PROTEGIENDO*/
    /*Ciclo 1 PRIMARIAS*/
ALTER TABLE usuarios ADD CONSTRAINT PK_usuario PRIMARY KEY(ID);
ALTER TABLE numeroscontactos ADD CONSTRAINT PK_numeroscontactos PRIMARY KEY(ID);
ALTER TABLE personasnaturales ADD CONSTRAINT PK_personasnaturales PRIMARY KEY(ID);
ALTER TABLE empresas ADD CONSTRAINT PK_empresas PRIMARY KEY(ID);
ALTER TABLE ofertas ADD CONSTRAINT PK_ofertas PRIMARY KEY(numero);
ALTER TABLE ofertas_fotografias ADD CONSTRAINT PK_ofertas_fotografias PRIMARY KEY(nombre);
ALTER TABLE ofertas_fotografias ADD CONSTRAINT PK_ofertas_fotografias PRIMARY KEY(numero);
ALTER TABLE fotografias ADD CONSTRAINT PK_Product PRIMARY KEY(nombre);
ALTER TABLE opcionescreditos ADD CONSTRAINT PK_fotografias PRIMARY KEY(numero);
ALTER TABLE ubicaciones ADD CONSTRAINT PK_ubicaciones PRIMARY KEY(codigo);
ALTER TABLE interesesen ADD CONSTRAINT PK_interesesen PRIMARY KEY(ubicacion);
ALTER TABLE interesesen ADD CONSTRAINT PK_interesesen PRIMARY KEY(demanda);
ALTER TABLE demanda ADD CONSTRAINT PK_demanda PRIMARY KEY(numero);
    
    /*Ciclo 1 Unicas*/
ALTER TABLE personasnaturales ADD CONSTRAINT UK_personasnaturales UNIQUE (tipoDocumento);
ALTER TABLE personasnaturales ADD CONSTRAINT UK_personasnaturales UNIQUE (numeroDocumento);
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
    ADD CONSTRAINT FK_ofertas
    FOREIGN KEY(ubicacion) 
    REFERENCES ubicacion(codigo);

ALTER TABLE empresas 
    ADD CONSTRAINT FK_empresas
    FOREIGN KEY(persona) 
    REFERENCES personasnaturales(ID);

ALTER TABLE empresas 
    ADD CONSTRAINT FK_empresas
    FOREIGN KEY(persona) 
    REFERENCES personasnaturales(ID);
    
ALTER TABLE ofertas_fotografias 
    ADD CONSTRAINT FK_ofertas_fotografias
    FOREIGN KEY(nombre) 
    REFERENCES fotografias(nombre);
    
ALTER TABLE ofertas_fotografias 
    ADD CONSTRAINT FK_ofertas_fotografias
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
    ADD CONSTRAINT FK_interesesen
    FOREIGN KEY(demanda) 
    REFERENCES demanda(numero);
    
ALTER TABLE origenesfondos 
    ADD CONSTRAINT FK_origenesfondos
    FOREIGN KEY(demanda) 
    REFERENCES demanda(numero);

    /*CONSULTADO*/
SELECT nombres, apellidos
FROM personasnaturales
JOIN usuarios ON personasnaturales.ID = usuarios.ID
JOIN ofertas ON usuarios.ID = ofertas.usuario
WHERE costo > 500000.0;

/*Consultar el valor de los origenes de fondo*/
SELECT valor
FROM origenesfondos
WHERE valor > 300000.0

    /* NUEVAMENTE POBLADO */
/**/
