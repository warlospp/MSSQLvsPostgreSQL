----------------------
-- ALWAYS ENCRIPTED --
----------------------

--Crea un certificado autofirmado en el almacén de certificados del usuario actual, 
--que se usará como clave maestra para Always Encrypted.
--Este certificado actúa como un par de claves pública/privada que protegerá las 
--claves de cifrado de columna (Column Encryption Keys - CEK).
--Clave pública: se usa para cifrar las claves de cifrado de columnas 
--(Column Encryption Keys - CEK) que protegen los datos.
--Clave privada: se usa para descifrar esas claves CEK cuando la aplicación 
--necesita acceder a los datos en texto claro.

--$cert = New-SelfSignedCertificate -Subject "AlwaysEncryptedCert" -CertStoreLocation Cert:\CurrentUser\My -KeyExportPolicy Exportable -Type DocumentEncryptionCert -KeyUsage KeyEncipherment -KeySpec KeyExchange -KeyLength 2048
------------------------------------------------------------------
--Este comando busca en el almacén de certificados del usuario actual 
--(CurrentUser\My) todos los certificados cuyo subject contenga la cadena 
--"AlwaysEncryptedCert".
--Muestra el thumbprint (huella digital única) y el subject del certificado 
---recién creado.
--El thumbprint es un identificador que se usará para referenciar el certificado 
--cuando crees la clave maestra en SQL Server.

Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object {$_.Subject -like "*AlwaysEncryptedCert*"} | Select-Object Thumbprint,Subject
--Current User/Personal/F46B1B1E1FD045DC48E6A93E586B279736233F16
---------------------------------------------------------------------


-- COLUMN MASTER KEY
DROP COLUMN MASTER KEY MyCMK

CREATE COLUMN MASTER KEY MyCMK
WITH (
    KEY_STORE_PROVIDER_NAME = N'MSSQL_CERTIFICATE_STORE',
    KEY_PATH = N'CurrentUser/My/F46B1B1E1FD045DC48E6A93E586B279736233F16'
);

-- COLUMN ENCRIPTION KEY
DROP COLUMN ENCRYPTION KEY [MyCEK]

CREATE COLUMN ENCRYPTION KEY [MyCEK]
WITH VALUES
(
	COLUMN_MASTER_KEY = [MyCMK],
	ALGORITHM = 'RSA_OAEP', /*AEAD_AES_256_CBC_HMAC_SHA_256*/
	ENCRYPTED_VALUE = 0x016E000001630075007200720065006E00740075007300650072002F006D0079002F006600340036006200310062003100650031006600640030003400350064006300340038006500360061003900330065003500380036006200320037003900370033003600320033003300660031003600239848410E08F067FC5ACE31211E4609254924C3B5DB24B31EEC041F9A45A73BBFAC172ED150BA72194A2654114E212D350088457E9C595A00DD5F04878FA503CA467986383D08566A319C4E17B2662090B28498906B6926D8CB2B87EAC622F8A64CDEC0DEC219F697D8D257198CB64C31F1FAA72B130A0FFB5AF85F3AA8C8F67A46DE145C5EC750455A663862761DB5606D0020F9B444BA33D45EF6BA392549E303D84DF18F3AE0105C6F4389475E29F9C75EA717A76D201902DDA2D9624DB353FD2F987617069186647BFA7C82C641C73802DE90312BFD5A0BD46146F133B9E57172F0ACA25260BE636826C1DE933E28AB185BF6B46E4DE02ABE1777DB7FE75835344421D52DB5EA7AF9E0FC5221871652EADF4F8A26A2CDBC7A3601FCDFE76B151FF960C42BF53564230E46720E8FB00837F1851EBAD06C139BEF6AF67FFF358E76135E4E7A32FBE6B9DE328A3801610BA94DEC276FE88289CCD21420100BB05E2180DA7B8A5FB42FB4B31C4F6865B5FE7970A3C855A37BEFDC3E0B6653F9F437D673FD7EF68858FB6749252806C62D6F69D1432B5F269C722E178FDEDC7BB7DDBF107317C003D5CBAA2298F15B403CCB84BE148386DF8FD9B00A6794271D0AA20D2BE2D021E47FF44F7E28E36DAD30B8245CBC958E96112CCE3ED3EE535C2FA2D0291A6A673470552F55ABFFE6718601C798BF8340D7017DD45BE87DBFF1
)
GO

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
