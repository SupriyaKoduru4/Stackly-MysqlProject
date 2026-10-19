CREATE DATABASE movie_ticket_booking;

USE movie_ticket_booking;

CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    language VARCHAR(30),
    duration_minutes INT NOT NULL,
    release_date DATE
);

CREATE TABLE theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    theater_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id),
    UNIQUE (theater_id, show_date, show_time)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    seat_number INT NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ticket_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (show_id) REFERENCES shows(show_id),
    UNIQUE (show_id, seat_number)
);

USE movie_ticket_booking;

INSERT INTO movies (title, genre, language, duration_minutes, release_date)VALUES
('Devara', 'Action', 'Telugu', 178, '2024-09-27'),
('Hi Nanna', 'Drama', 'Telugu', 155, '2023-12-07'),
('Kalki 2898 AD', 'Sci-Fi', 'Telugu', 181, '2024-06-27');

INSERT INTO theaters (theater_name, location, total_seats) VALUES
('PVR Cinemas', 'Hyderabad', 100),
('INOX Cinema', 'Hyderabad', 80);

INSERT INTO shows (movie_id, theater_id, show_date, show_time, ticket_price) VALUES
(1, 1, '2026-10-25', '10:00:00', 200.00),
(2, 1, '2026-10-25', '14:00:00', 180.00),
(3, 2, '2026-10-25', '18:00:00', 250.00);

SELECT * FROM movies;
SELECT * FROM theaters;
SELECT * FROM shows;
SELECT * FROM bookings;

SHOW DATABASES;