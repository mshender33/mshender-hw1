-- Drop existing tables
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;

-- Create new tables
CREATE TABLE studios (
    studio_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_released INTEGER,
    mpaa_rating TEXT,
    studio_id INTEGER
);

CREATE TABLE actors (
    actor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE roles (
    role_id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INTEGER,
    actor_id INTEGER,
    character_name TEXT
);

-- Insert data into studios
INSERT INTO studios (name) VALUES
('Warner Bros.');

-- Insert data into movies
INSERT INTO movies (title, year_released, mpaa_rating, studio_id) VALUES
('Batman Begins', 2005, 'PG-13', 1),
('The Dark Knight', 2008, 'PG-13', 1),
('The Dark Knight Rises', 2012, 'PG-13', 1);

-- Insert data into actors
INSERT INTO actors (name) VALUES
('Christian Bale'),
('Michael Caine'),
('Liam Neeson'),
('Katie Holmes'),
('Gary Oldman'),
('Heath Ledger'),
('Aaron Eckhart'),
('Maggie Gyllenhaal'),
('Tom Hardy'),
('Joseph Gordon-Levitt'),
('Anne Hathaway');

-- Insert data into roles
INSERT INTO roles (movie_id, actor_id, character_name) VALUES
(1, 1, 'Bruce Wayne'),
(1, 2, 'Alfred'),
(1, 3, 'Ra''s Al Ghul'),
(1, 4, 'Rachel Dawes'),
(1, 5, 'Commissioner Gordon'),
(2, 1, 'Bruce Wayne'),
(2, 6, 'Joker'),
(2, 7, 'Harvey Dent'),
(2, 2, 'Alfred'),
(2, 8, 'Rachel Dawes'),
(3, 1, 'Bruce Wayne'),
(3, 5, 'Commissioner Gordon'),
(3, 9, 'Bane'),
(3, 10, 'John Blake'),
(3, 11, 'Selina Kyle');

-- .print causing errors
.mode column;
.headers OFF;

-- Movies table
SELECT 
    m.title AS Title, 
    m.year_released AS Year, 
    m.mpaa_rating AS Rating, 
    s.name AS Studio
FROM movies m
JOIN studios s ON m.studio_id = s.studio_id;


-- Cast table
SELECT 
    m.title AS Movie, 
    a.name AS Actor, 
    r.character_name AS Character
FROM roles r
JOIN movies m ON r.movie_id = m.movie_id
JOIN actors a ON r.actor_id = a.actor_id
ORDER BY m.title, r.role_id;