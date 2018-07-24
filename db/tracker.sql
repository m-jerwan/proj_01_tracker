DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants(
  id SERIAL8 primary key,
  merchant_name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  tag_name VARCHAR(255)
);

CREATE TABLE transactions(
  time_stamp VARCHAR(255),   -- TIME IS BEING SEND TO SQL AS STRING
  amount FLOAT,
  id SERIAL8 primary key,
  merchant_id INT8 references merchants(id) ON DELETE CASCADE,
  tag_id INT8 references tags(id) ON DELETE CASCADE
);
