select * from demo

SELECT claro,encriptado, pgp_sym_decrypt(encriptado, 'Admin.123123')
FROM demo
where claro = '0603661679'
UNION ALL
SELECT claro,encriptado, pgp_sym_decrypt(encriptado, 'Admin.123123123')
FROM demo
where claro = '0603661670';
