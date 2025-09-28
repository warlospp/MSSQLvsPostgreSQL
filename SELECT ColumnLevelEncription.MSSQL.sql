-----------------------------
-- COLUMN LEVEL ENCRYPTION --
-----------------------------
OPEN SYMMETRIC KEY ClaveSimetricaAdmin DECRYPTION BY CERTIFICATE CertificadoAdmin;
INSERT INTO demo_alwaysencripted (claro, password)
VALUES (
    '0603661679',
    EncryptByKey(Key_GUID('ClaveSimetricaAdmin'), '0603661679')
);
CLOSE SYMMETRIC KEY ClaveSimetricaAdmin;

select * from demo_alwaysencripted

OPEN SYMMETRIC KEY ClaveSimetricaAdmin DECRYPTION BY CERTIFICATE CertificadoAdmin;
SELECT 
    *,
    CONVERT(VARCHAR(100), DecryptByKey(password)) AS dato_desencriptado
FROM demo_alwaysencripted;
CLOSE SYMMETRIC KEY ClaveSimetricaAdmin;

DECLARE @password VARCHAR(10) = '0603661679';
OPEN SYMMETRIC KEY ClaveSimetricaAdmin DECRYPTION BY CERTIFICATE CertificadoAdmin;
SELECT 
    *,
    CONVERT(VARCHAR(100), DecryptByKey(password)) AS dato_desencriptado
FROM demo_alwaysencripted
where CONVERT(VARCHAR(100), DecryptByKey(password)) = @password;
CLOSE SYMMETRIC KEY ClaveSimetricaAdmin;

DECLARE @password VARCHAR(10) = '0603661679';
OPEN SYMMETRIC KEY ClaveSimetricaAdmin DECRYPTION BY CERTIFICATE CertificadoAdmin;
SELECT 
    *,
    CONVERT(VARCHAR(100), DecryptByKey(password)) AS dato_desencriptado
FROM demo_alwaysencripted
where CONVERT(VARCHAR(100), DecryptByKey(password)) like '%' + @password + '%';
CLOSE SYMMETRIC KEY ClaveSimetricaAdmin;

DECLARE @password VARCHAR(10) = '0603661679';
OPEN SYMMETRIC KEY ClaveSimetricaAdmin DECRYPTION BY CERTIFICATE CertificadoAdmin;
SELECT 
    *,
    CONVERT(VARCHAR(100), DecryptByKey(password)) AS dato_desencriptado
FROM demo_alwaysencripted
where CONVERT(VARCHAR(100), DecryptByKey(password)) in ( @password );
CLOSE SYMMETRIC KEY ClaveSimetricaAdmin;
