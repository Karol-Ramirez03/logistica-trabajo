
CREATE DATABASE logistica;
USE logistica;

CREATE TABLE paises(
    idpais VARCHAR(8),
    nombre VARCHAR(25),
    CONSTRAINT pk_id_pais PRIMARY KEY (idpais)
);

CREATE TABLE ciudades(
    idciudades VARCHAR(5),
    nombre VARCHAR(30),
    idpais VARCHAR(8),
    CONSTRAINT pk_id_ciudades PRIMARY KEY (idciudades),
    CONSTRAINT fk_pais_ciudad FOREIGN KEY (idpais) REFERENCES paises(idpais)
);

CREATE TABLE sucursales(
    idsucursal INT AUTO_INCREMENT,
    direccion VARCHAR(30),
    idciudades VARCHAR(5),
    CONSTRAINT pk_id_sucursal PRIMARY KEY (idsucursal),
    CONSTRAINT fk_ciudad_surcursal FOREIGN KEY (idciudades) REFERENCES ciudades(idciudades)
);

CREATE TABLE marcas(
    idmarca INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_marca PRIMARY KEY (idmarca)
);

CREATE TABLE modelos(
    idmodelo INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    idmarca INT,
    CONSTRAINT pk_id_modelo PRIMARY KEY (idmodelo),
    CONSTRAINT fk_marca_modelos FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

CREATE TABLE vehiculos(
    placa VARCHAR(7),
    Capacidadcarga DECIMAL(10, 2),
    idmodelo INT,
    idsucursal INT,
    CONSTRAINT pk_id_vehiculo PRIMARY KEY (placa),
    CONSTRAINT fk_sucursal_vehiculo FOREIGN KEY (idsucursal) REFERENCES sucursales(idsucursal),
    CONSTRAINT fk_modelo_vehiculo FOREIGN KEY (idmodelo) REFERENCES modelos(idmodelo)
);

CREATE TABLE tipodocumentos(
    idtipodoc INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_tipodoc PRIMARY KEY (idtipodoc)
);

CREATE TABLE conductores(
    idconductor INT,
    nombre VARCHAR(30),
    idtipdoc INT,
    CONSTRAINT pk_id_conductores PRIMARY KEY (idconductor),
    CONSTRAINT fk_tipodoc_conductores FOREIGN KEY (idtipdoc) REFERENCES tipodocumentos(idtipodoc)
);

CREATE TABLE rutas(
    idrutas INT AUTO_INCREMENT,
    sucursalid INT,
    descripcion VARCHAR(200),
    CONSTRAINT pk_id_rutas PRIMARY KEY (idrutas),
    CONSTRAINT fk_sucursal_rutas FOREIGN KEY (sucursalid) REFERENCES sucursales(idsucursal)
);

CREATE TABLE rutasconductor (
    conductorid INT,
    rutaid INT,
    placa VARCHAR(7),
    idsucursal INT,
    CONSTRAINT pk_rutasconductor PRIMARY KEY (conductorid, rutaid),
    CONSTRAINT fk_conductor_rutasconductor FOREIGN KEY (conductorid) REFERENCES conductores(idconductor),
    CONSTRAINT fk_ruta_rutasconductor FOREIGN KEY (rutaid) REFERENCES rutas(idrutas),
    CONSTRAINT fk_vehiculos_rutasconductor FOREIGN KEY (placa) REFERENCES vehiculos(placa),
    CONSTRAINT fk_sucursal_rutasconductor FOREIGN KEY (idsucursal) REFERENCES sucursales(idsucursal)
);

CREATE TABLE estados(
    idestados INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_estados PRIMARY KEY (idestados)
);

CREATE TABLE tiposervicios(
    idservicios INT AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_tiposervicios PRIMARY KEY (idservicios)
);

CREATE TABLE paquetes (
    idpaquete INT AUTO_INCREMENT,
    idseguimiento INT,
    peso DECIMAL(10,2),
    dimenciones VARCHAR(50),
    contenido TEXT,
    valordeclarado DOUBLE,
    idtiposervicio INT,
    idestado INT,
    CONSTRAINT pk_id_paquetes PRIMARY KEY (idpaquete),
    CONSTRAINT fk_tiposervicios_paquetes FOREIGN KEY (idtiposervicio) REFERENCES tiposervicios(idservicios),
    CONSTRAINT fk_estado_paquetes FOREIGN KEY (idestado) REFERENCES estados(idestados)
);

CREATE TABLE seguimientos (
    idseguimiento INT AUTO_INCREMENT,
    idpaquete INT,
    ubicacion VARCHAR(200),
    fechahora TIMESTAMP,
    CONSTRAINT pk_id_seguimientos PRIMARY KEY (idseguimiento),
    CONSTRAINT fk_paquete_seguimientos FOREIGN KEY (idpaquete) REFERENCES paquetes(idpaquete)
);

CREATE TABLE clientes(
    idcliente INT,
    nombre VARCHAR(30),
    correo VARCHAR(50),
    direccion VARCHAR(50),
    idtipdoc INT,
    CONSTRAINT pk_id_clientes PRIMARY KEY (idcliente),
    CONSTRAINT fk_tipodoc_clientes FOREIGN KEY (idtipdoc) REFERENCES tipodocumentos(idtipodoc)
);

CREATE TABLE auxiliares(
    idauxiliares INT,
    nombre VARCHAR(30),
    telefono VARCHAR(15),
    idtipdoc INT,
    CONSTRAINT pk_id_auxiliares PRIMARY KEY (idauxiliares),
    CONSTRAINT fk_tipodoc_auxiliares FOREIGN KEY (idtipdoc) REFERENCES tipodocumentos(idtipodoc)
);

CREATE TABLE envios(
    idenvio INT AUTO_INCREMENT,
    idcliente INT,
    idpaquete INT,
    idsucursal INT,
    idrutas INT,
    fehaenvio TIMESTAMP,
    destino VARCHAR(100),
    CONSTRAINT pk_id_envios PRIMARY KEY (idenvio),
    CONSTRAINT fk_envios_rutas FOREIGN KEY (idrutas) REFERENCES rutas(idrutas),
    CONSTRAINT fk_envios_clientes FOREIGN KEY (idcliente) REFERENCES clientes(idcliente),
    CONSTRAINT fk_envios_paquete FOREIGN KEY (idpaquete) REFERENCES paquetes(idpaquete),
    CONSTRAINT fk_envios_sucursal FOREIGN KEY (idsucursal) REFERENCES sucursales(idsucursal)
);

CREATE TABLE rutasauxiliares(
    rutaid INT,
    idauxiliar INT,
    CONSTRAINT pk_id_ruta_auxiliares PRIMARY KEY (rutaid, idauxiliar),
    CONSTRAINT fk_ruta_rutasauxiliares FOREIGN KEY (rutaid) REFERENCES rutas(idrutas),
    CONSTRAINT fk_auxiliar_rutasauxiliares FOREIGN KEY (idauxiliar) REFERENCES auxiliares(idauxiliares)
);

CREATE TABLE telconductores(
    idtel INT AUTO_INCREMENT,
    numero VARCHAR(15),
    idconductor INT,
    CONSTRAINT pk_id_telconductor PRIMARY KEY (idtel),
    CONSTRAINT fk_conductor_telconductor FOREIGN KEY (idconductor) REFERENCES conductores(idconductor)
);

CREATE TABLE telclientes(
    idtelclientes INT AUTO_INCREMENT,
    numero VARCHAR(15),
    idcliente INT,
    CONSTRAINT pk_id_telcliente PRIMARY KEY (idtelclientes),
    CONSTRAINT fk_cliente_telcliente FOREIGN KEY (idcliente) REFERENCES clientes(idcliente)
);




