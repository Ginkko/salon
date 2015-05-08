#Salon-O-Rama
By Alec Arme
Ruby v 2.2.0

Features:
- Create/Delete Stylists
- Create/Delete Clients
- Assign Clients to Stylists

Installation:
- Bundle to install all gems.
- Requires a PSQL Database with the following setup method:
  - #psql
  - CREATE DATABASE hair_salon;
  - \c hair_salon
  - CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
  - CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
  - CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
- If properly set up, the tables will have the following layout:

  - Table Stylists:

    id  | name
    ------------- | -------------
    1  | Tiberius
    2  | Leonard

  - Table Clients:

    id  | name  | stylist_id
    ----|-------| -------------
    1  | Khan   | 2
    2  | Q      | nil



MIT LICENSE
