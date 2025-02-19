create database stock;
 use  stock;

CREATE TABLE produit (
    id int  auto_increment primary key  ,
    name varchar(255),
    description varchar(255),
    quantity int,
    price int,
    category varchar(30)
);
