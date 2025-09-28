--------------------------
-- DYNAMIC DATA MASKING --
--------------------------

-- MASKING
ALTER TABLE demo_alwaysencripted ALTER COLUMN claro ADD MASKED WITH (FUNCTION = 'default()'); 

-- PERMISSIONS
GRANT UNMASK TO [usr_lectura];

REVOKE UNMASK TO [usr_lectura];
