create table Administrador (
    id number(8) PRIMARY KEY,
    nombre Varchar(10) not null,
    direccion Varchar(20),
    telefono number(10)
    );
    
create table barbero (
    id number(8) PRIMARY KEY,
    nombre Varchar(10) not null,
    direccion Varchar(20),
    telefono number(10) not null,
    maquinaAsignada number(2) not null,
    porcentajeComision number(2) not null
)

create table cliente(
    id number(8) PRIMARY KEY,
    nombre Varchar(10) not null,
    direccion Varchar(20),
    telefono number(10)
    );
    
create table proveedor(
    id number(8) PRIMARY KEY,
    nombre Varchar(10) not null,
    direccion Varchar(20),
    telefono number(10)
    );

create table producto(
    codigo number(8) primary key,
    nombre varchar2(10) not null
    );

create table inventario(
    codigoProducto number(8) primary key,
    costo number(8) not null,
    nombre varchar2(10) not null,
    codigoProveedor number(8) not null,
    cantidad number(3) not null,
    foreign key (codigoProveedor) references proveedor(id),
    foreign key (codigoProducto) references producto(codigo)
    );
    
create table corte(
    precio number(5) primary key,
    nombre varchar2(10) not null,
    codigo number(8) not null,
    productoObligatorio1 number(8),
    productoObligatorio2 number(8),
    extras number(8) not null
);

create table venta(
    codigoVenta number(8) primary key,
    codigoCorte number(8) not null,
    fecha timestamp not null,
    codigoCliente number(8) not null,
    codigoBarbero number(8) not null,
    costo number(5) not null,
    propina number(5),
    porcentajeComision number(2) not null,
    foreign key (codigoCorte) references corte(codigo),
    foreign key (codigoCliente) references cliente(id),
    foreign key (codigoBarbero) references barbero(id)
);

