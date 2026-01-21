create database first;
use first;
create table movies(
      movie_id INT PRIMARY KEY auto_increment,
      title VARCHAR(200) NOT NULL,
      genre VARCHAR(200),
      release_year INT,
      duration_min INT,
      language VARCHAR(30)
      );
      
      CREATE TABLE users(
      user_id INT PRIMARY KEY auto_increment,
      user_name VARCHAR(200) unique NOT NULL,
      email_id VARCHAR(200) unique,
      gendre CHAR(1),
      age INT,
      join_date date
      );
      
      CREATE TABLE rating(
              rating_id INT PRIMARY KEY auto_increment,
              user_id INT,
              movie_id INT, 
              rating decimal(2,1),
              rating_date DATE,
              FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE,
              FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON UPDATE CASCADE
              );
      
      INSERT INTO movies (title, genre, release_year, duration_min, language) VALUES
('Inception', 'Sci-Fi', 2010, 148, 'English'),
('Titanic', 'Romance', 1997, 195, 'English'),
('The Dark Knight', 'Action', 2008, 152, 'English'),
('Interstellar', 'Sci-Fi', 2014, 169, 'English'),
('Avengers: Endgame', 'Action', 2019, 181, 'English'),
('Forrest Gump', 'Drama', 1994, 142, 'English'),
('Gladiator', 'Action', 2000, 155, 'English'),
('Joker', 'Drama', 2019, 122, 'English'),
('Parasite', 'Thriller', 2019, 132, 'Korean'),
('The Matrix', 'Sci-Fi', 1999, 136, 'English'),
('Avatar', 'Fantasy', 2009, 162, 'English'),
('The Godfather', 'Crime', 1972, 175, 'English'),
('Shawshank Redemption', 'Drama', 1994, 142, 'English'),
('Fight Club', 'Drama', 1999, 139, 'English'),
('The Prestige', 'Mystery', 2006, 130, 'English'),
('Whiplash', 'Drama', 2014, 107, 'English'),
('Dangal', 'Sports', 2016, 161, 'Hindi'),
('Bahubali', 'Fantasy', 2015, 159, 'Telugu'),
('3 Idiots', 'Comedy', 2009, 170, 'Hindi'),
('John Wick', 'Action', 2014, 101, 'English');


INSERT INTO users (user_name, email_id, gendre, age, join_date) VALUES
('alice', 'alice@gmail.com', 'F', 24, '2023-01-10'),
('bob', 'bob@gmail.com', 'M', 28, '2023-01-15'),
('charlie', 'charlie@gmail.com', 'M', 32, '2023-02-01'),
('diana', 'diana@gmail.com', 'F', 26, '2023-02-10'),
('edward', 'edward@gmail.com', 'M', 35, '2023-03-05'),
('fiona', 'fiona@gmail.com', 'F', 22, '2023-03-15'),
('george', 'george@gmail.com', 'M', 40, '2023-04-01'),
('harry', 'harry@gmail.com', 'M', 29, '2023-04-10'),
('irene', 'irene@gmail.com', 'F', 27, '2023-04-20'),
('jack', 'jack@gmail.com', 'M', 31, '2023-05-01'),
('karen', 'karen@gmail.com', 'F', 34, '2023-05-10'),
('leo', 'leo@gmail.com', 'M', 23, '2023-05-20'),
('mia', 'mia@gmail.com', 'F', 25, '2023-06-01'),
('nathan', 'nathan@gmail.com', 'M', 38, '2023-06-10'),
('olivia', 'olivia@gmail.com', 'F', 21, '2023-06-20'),
('paul', 'paul@gmail.com', 'M', 36, '2023-07-01'),
('queen', 'queen@gmail.com', 'F', 28, '2023-07-10'),
('ryan', 'ryan@gmail.com', 'M', 33, '2023-07-20'),
('sophia', 'sophia@gmail.com', 'F', 26, '2023-08-01'),
('tom', 'tom@gmail.com', 'M', 41, '2023-08-10');


INSERT INTO rating (user_id, movie_id, rating, rating_date) VALUES
(1, 1, 4.5, '2024-01-01'),
(2, 2, 4.0, '2024-01-02'),
(3, 3, 5.0, '2024-01-03'),
(4, 4, 4.5, '2024-01-04'),
(5, 5, 4.8, '2024-01-05'),
(6, 6, 4.2, '2024-01-06'),
(7, 7, 4.6, '2024-01-07'),
(8, 8, 4.1, '2024-01-08'),
(9, 9, 4.7, '2024-01-09'),
(10, 10, 5.0, '2024-01-10'),
(11, 11, 4.3, '2024-01-11'),
(12, 12, 4.9, '2024-01-12'),
(13, 13, 5.0, '2024-01-13'),
(14, 14, 4.4, '2024-01-14'),
(15, 15, 4.6, '2024-01-15'),
(16, 16, 4.8, '2024-01-16'),
(17, 17, 4.5, '2024-01-17'),
(18, 18, 4.2, '2024-01-18'),
(19, 19, 4.9, '2024-01-19'),
(20, 20, 4.3, '2024-01-20');

SELECT * FROM movies;
SELECT * FROM users;
SELECT * FROM rating;
SELECT m.title,r.rating FROM movies m JOIN rating r ON m.movie_id=r.movie_id;
SELECT MAX(rating) FROM rating;
SELECT m.title,r.rating FROM movies m JOIN rating r ON m.movie_id=r.movie_id WHERE r.rating =5.0;
SELECT AVG(rating) FROM rating;
SELECT m.title,r.rating FROM movies m JOIN rating r ON m.movie_id=r.movie_id WHERE r.rating =4.5;
SELECT MIN(rating) FROM rating;


SELECT m.genre,r.rating FROM movies m JOIN rating r ON m.movie_id=r.movie_id;
SELECT MAX(RATING) FROM rating;
SELECT m.genre,r.rating FROM movies m JOIN rating r ON m.movie_id=r.movie_id WHERE rating=5.0;
SELECT
    CASE 
        WHEN u.age <= 30 THEN 'Younger'
        ELSE 'Older'
    END AS age_group,
    COUNT(r.rating) AS total_ratings
FROM users u
JOIN rating r
ON u.user_id = r.user_id
GROUP BY age_group;


SELECT 
    m.title,
    AVG(r.rating) AS avg_rating
FROM movies m
JOIN rating r 
ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC
LIMIT 5;
SELECT 
    m.title,
    AVG(r.rating) AS avg_rating
FROM movies m
JOIN rating r 
ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC
LIMIT 5;
