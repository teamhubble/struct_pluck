DROP TABLE IF EXISTS text_array_records;

CREATE TABLE text_array_records(
  id serial PRIMARY KEY,
  texts text[]
);


DROP TABLE IF EXISTS varchar_array_records;

CREATE TABLE varchar_array_records(
  id serial PRIMARY KEY,
  varchars varchar[]
);

DROP TABLE IF EXISTS normal_tables;

CREATE TABLE normal_tables(
  id serial PRIMARY KEY,
  name varchar,
  tax integer
);
