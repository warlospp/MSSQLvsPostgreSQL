-----------------------------
-- COLUMN LEVEL ENCRYPTION --
-----------------------------

-- MASTER KEY
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Admin.123123';

-- CERTIFICATE
CREATE CERTIFICATE CertificadoAdmin WITH SUBJECT = 'Certificado para column-level encryption';

-- SYMETRIC KEY
CREATE SYMMETRIC KEY ClaveSimetricaAdmin WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE CertificadoAdmin;
