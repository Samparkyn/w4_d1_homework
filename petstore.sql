CREATE TABLE stores (
  id serial8 primary key,
  name varchar(255),
  address varchar(255),
  stock varchar(255)
);

CREATE TABLE pets (
  id serial8 primary key,
  store_id int8 references stores(id),
  name varchar(255),
  species varchar(255),
  image_url varchar(255)
);