drop table demo

-- Claro

create table demo
(
	claro char(10),
	encriptado char(10)
)

insert into demo (claro,encriptado) values ('0603661679','0603661679')

select * from demo

-------------
-- Cifrado --
-------------

--La función crypt con sal generada por gen_salt, 
--que aplica hashing seguro para contraseñas:

--Cifrado y descifrado simétrico
--encrypt y decrypt

create table demo
( 
	claro char(10),
	encriptado BYTEA
)

insert into demo (claro,encriptado) values ('0603661679','0603661679')


insert into demo (claro,encriptado) values ('0603661679', pgp_sym_encrypt('0603661679', 'Admin.123123')) 


insert into demo (claro,encriptado) values ('0603661670', pgp_sym_encrypt('0603661670', 'Admin.123123123')) 
