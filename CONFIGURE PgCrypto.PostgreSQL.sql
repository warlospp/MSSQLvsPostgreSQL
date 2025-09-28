--...Enable

-- Create
CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT * FROM pg_extension WHERE extname = 'pgcrypto';
