-- --title 'Data migration efforts' --height 7
SELECT
    object_type,
    table_format,
    location,
    estimated_effort,
    suggestion
FROM
VALUES
    ('MANAGED', 'DELTA', Null, 0.5, 'CTAS or recreate as external table in S3/ADLS, then SYNC'),
    ('MANAGED', 'not DELTA', Null, 2, 'Can vary depending of table_format'),
    ('EXTERNAL', 'DELTA', 'dbfs:/', 0.5, 'CTAS or recreate as external table in S3/ADLS, then SYNC'),
    ('EXTERNAL', 'DELTA', 'adl:/', 0.5, 'CTAS or recreate as external table in S3/ADLS, then SYNC'),
    ('EXTERNAL', 'DELTA', 'wasbs:/', 0.5, 'CTAS or recreate as external table in S3/ADLS, then SYNC'),
    ('EXTERNAL', 'DELTA', 'adls:/ or S3:/', 0.1, 'In place SYNC'),
    ('EXTERNAL', 'not DELTA', Null, 2, 'Can vary depending of table_format'),
    ('EXTERNAL', 'SQLSERVER, MYSQL or SNOWFLAKE', Null, 2, 'Recreate via Lakehouse Federation'),
    ('VIEW', Null, Null, 2, 'Recreate in target catalog on UC, can vary depending on the number of tables in the view') AS tab(object_type, table_format, location, estimated_effort, suggestion)
