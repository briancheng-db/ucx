-- --title UDF Summary, search_by=name,
SELECT *
  catalog,
  database,
  name,
  func_type,
  func_input,
  func_returns,
  deterministic,
  data_access,
  body,
  comment
FROM inventory.udfs
