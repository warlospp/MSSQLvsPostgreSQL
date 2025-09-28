use arqdatdemomssqlsql

----------------------
-- ALWAYS ENCRIPTED --
----------------------
insert into demo_alwaysencripted (claro,encriptado) values ('0603661679','0603661679')

insert into demo_alwaysencripted (claro,encriptado) values ('0603661679','0603661679' COLLATE Latin1_General_BIN2)

DECLARE @claro CHAR(10) = '0603661679';
DECLARE @encriptado VARCHAR(10) = '0603661679';
INSERT INTO demo_alwaysencripted (claro, encriptado) VALUES (@claro, @encriptado);

DECLARE @claro CHAR(10) = '0603661679';
DECLARE @encriptado VARCHAR(10) = '0603661679';
INSERT INTO demo_alwaysencripted (claro, encriptado) VALUES (@claro, @encriptado COLLATE Latin1_General_BIN2);

select * from demo_alwaysencripted

select * from demo_alwaysencripted
order by encriptado 

select * from demo_alwaysencripted
where encriptado = '0603661679' 

select * from demo_alwaysencripted
where encriptado = '0603661679' COLLATE Latin1_General_BIN2

DECLARE @encriptado VARCHAR(10) = '0603661679';
select * from demo_alwaysencripted
where encriptado = @encriptado

DECLARE @encriptado VARCHAR(10) = '0603661679';
select * from demo_alwaysencripted
where encriptado like '%' + @encriptado + '%'

DECLARE @encriptado VARCHAR(10) = '0603661679';
select * from demo_alwaysencripted
where encriptado IN (@encriptado)
