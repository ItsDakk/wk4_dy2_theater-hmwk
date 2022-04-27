DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    "name" VARCHAR(100),
    phone VARCHAR(13),
    email VARCHAR(50)
);

DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie(
    film_name TEXT PRIMARY KEY,
    run_time TEXT
);

DROP TABLE IF EXISTS ticket CASCADE;
CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    price DECIMAL (10,2),
    customer_id INTEGER NOT NULL,
    film_name TEXT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(film_name) REFERENCES movie(film_name)
);

DROP TABLE IF EXISTS concessions CASCADE;
CREATE TABLE concession(
    item TEXT,
    ticket_id INTEGER NOT NULL,
    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

INSERT INTO customer ("name", phone, email) VALUES
('Dak', '1234567890', 'dakattack@gmail.com'),
('Keenan', '0987654321', 'kdawg@hotmail.com'),
('Bryce', '1357908642', 'kdawg@hotmail.com');

UPDATE customer
SET email = 'spicybrycy@yahoo.com'
WHERE customer_id = 3;

INSERT INTO movie (film_name, run_time) VALUES
('The Englishman Who Went Up a Hill But Came Down a Mountain', '99Min'),
('Killer Klowns from Outer Space', '88Min'),
('Attack of the Killer Tomatoes!', '83Min');

ALTER TABLE movie
ADD film_rating VARCHAR(6);

ALTER TABLE movie
ADD film_id SERIAL;

UPDATE movie
SET film_rating = 'PG'
WHERE film_id = 1;

UPDATE movie
SET film_rating = 'PG'
WHERE film_id = 3;

UPDATE movie
SET film_rating = 'PG-13'
WHERE film_id = 2;

INSERT INTO ticket (price, film_name, customer_id) VALUES
(999, 'The Englishman Who Went Up a Hill But Came Down a Mountain', 1),
(99.99, 'Killer Klowns from Outer Space', 2),
(999.99, 'Attack of the Killer Tomatoes!', 3);

INSERT INTO concession (item, ticket_id) VALUES
('Headcheese', 1),
('Welsh Rabbit', 4),
('Rocky Mountain Oysters', 5);

ALTER TABLE concession
ADD price DECIMAL (10,2);

UPDATE concession 
SET price = 124.99
WHERE item = 'Headcheese';

UPDATE concession 
SET price = .999
WHERE item = 'Welsh Rabbit';

UPDATE concession 
SET price = 500.22
WHERE item = 'Rocky Mountain Oysters';