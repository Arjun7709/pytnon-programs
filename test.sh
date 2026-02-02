#!/bin/bash

# PostgreSQL connection details
PGHOST="localhost"
PGPORT="5432"
PGDATABASE="postgres"
PGUSER="postgres"

# Run SQL script
psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE <<EOF


SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'arjun'
  AND table_name IN ('emp', 'student');

-- Row count from both tables
SELECT 'emp' AS table_name, COUNT(*) AS total_rows FROM arjun.emp
UNION ALL
SELECT 'student' AS table_name, COUNT(*) AS total_rows FROM arjun.student;

-- Sample data
SELECT 'emp' AS table_name, emp_id AS id, emp_name AS name
FROM arjun.emp
LIMIT 5
UNION ALL
SELECT 'student' AS table_name, student_id AS id, student_name AS name
FROM arjun.student
LIMIT 5;

EOF
