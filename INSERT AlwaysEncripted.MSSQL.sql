
-- TABLE
drop table demo_alwaysencripted

CREATE TABLE demo_alwaysencripted (
    claro char(10),
    encriptado varchar(10),
	password VARBINARY(MAX)
);

insert into demo_alwaysencripted (claro,encriptado) values ('0603661679','0603661679')

select * from demo_alwaysencripted

select 
	name,
	is_masked,
	collation_name,
	encryption_type_desc,	
	encryption_algorithm_name,	
	column_encryption_key_database_name
from sys.all_columns where object_id = object_id('demo_alwaysencripted')

-- ...Encriptar

CREATE TABLE demo_alwaysencripted (
    claro char(10),
    encriptado varchar(10) COLLATE Latin1_General_BIN2,
	password VARBINARY(MAX)
);

-- ...Encriptar
