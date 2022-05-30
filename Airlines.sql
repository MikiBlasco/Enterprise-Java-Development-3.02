DROP schema airlines;
CREATE schema airlines;

USE airlines;

CREATE TABLE aircrafts(
aircraft_name VARCHAR(25) NOT NULL,
total_seats INT,
primary key(aircraft_name)
);

CREATE TABLE flights(
flight_number VARCHAR(25) NOT NULL,
flight_mileage INT,
aircraft VARCHAR(25),
primary key(flight_number),
FOREIGN KEY (aircraft) REFERENCES aircrafts(aircraft_name)
);

CREATE TABLE customers(
name VARCHAR(20),
status VARCHAR(10),
customer_mileage INT,
primary key(name)
);

CREATE TABLE customers_flights(
id INT NOT NULL,
name VARCHAR(20),
flight_number VARCHAR(25),
primary key(id),
FOREIGN KEY (flight_number) REFERENCES flights(flight_number),
FOREIGN KEY (name) REFERENCES customers(name)
);



INSERT INTO aircrafts(aircraft_name, total_seats) VALUES
("Boeing 747",  400),
("Airbus A330", 236),
("Boeing 777",  264);

INSERT INTO flights(flight_number, flight_mileage, aircraft) VALUES
("DL143", 135, "Boeing 747"),
("DL122", 4370 , "Airbus A330"),
("DL53", 2078, "Boeing 777"),
("DL222", 1765, "Airbus A330"),
("DL37", 531, "Boeing 747");

INSERT INTO customers(name, status, customer_mileage) VALUES
("Agustine Riviera", "Silver", 115235),
("Alaina Sepulvida", "None", 6008),
("Tom Jones", "Gold", 205767),
("Sam Rio", "None", 2653),
("Jessica James", "Silver", 127656),
("Ana Janco", "Silver", 136773),
("Jennifer Cortez", "Gold", 300582),
("Christian Janco", "Silver", 14642);


INSERT INTO customers_flights(id, name, flight_number) VALUES
(1, "Agustine Riviera", "DL143"),
(2, "Agustine Riviera","DL122"),
(3, "Alaina Sepulvida",  "DL122"),
(4, "Tom Jones", "DL122"),
(5, "Tom Jones", "DL53"),
(6, "Sam Rio", "DL143"),
(7, "Sam Rio", "DL37"),
(8, "Jessica James", "DL143"),
(9, "Jessica James", "DL122"),
(10, "Ana Janco", "DL222"),
(11, "Jennifer Cortez", "DL222"),
(12, "Christian Janco", "DL222");


-- get the total number of flights in the database:
SELECT COUNT(*) FROM flights;

--  get the average flight distance:
SELECT AVG(flight_mileage) FROM flights;

-- get the average number of seats
SELECT AVG(total_seats) FROM aircrafts;

-- get the average number of miles flown by customers grouped by status
SELECT status, AVG(customer_mileage) FROM customers GROUP BY status;

-- get the maximum number of miles flown by customers grouped by status.
SELECT status, MAX(customer_mileage) FROM customers GROUP BY status;

-- get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*) FROM aircrafts WHERE aircraft_name LIKE "boeing%";

-- find all flights with a distance between 300 and 2000 miles.
SELECT flight_number, flight_mileage FROM flights WHERE flight_mileage BETWEEN 300 AND 2000;

-- find the average flight distance booked grouped by customer status - this should require a join
SELECT AVG(flight_mileage) FROM flights 
JOIN customers_flights ON flights.flight_number = customers_flights.flight_number
JOIN customers ON customers_flights.name = customers.name GROUP BY status;

-- find the most often booked aircraft by gold status members - this should require a join
SELECT aircraft_name FROM aircrafts
JOIN flights ON aircrafts.aircraft_name = flights.aircraft
JOIN customers_flights ON flights.flight_number = customers_flights.flight_number
JOIN customers ON customers_flights.name = customers.name WHERE status = "gold";








 












