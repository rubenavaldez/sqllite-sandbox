INSERT INTO users(first_name, last_name, email, password, location, dept, is_admin, register_date)
values('John','Doe','john@email.com', '123456', 'Maine', 'development', 1, now());
SELECT * FROM users;
INSERT INTO users (first_name, last_name, email, password, location, dept,  is_admin, register_date) values ('Fred', 'Smith', 'fred@gmail.com', '123456', 'New York', 'design', 0, now()), ('Sara', 'Watson', 'sara@gmail.com', '123456', 'New York', 'design', 0, now()),('Will', 'Jackson', 'will@yahoo.com', '123456', 'Rhode Island', 'development', 1, now()),('Paula', 'Johnson', 'paula@yahoo.com', '123456', 'Massachusetts', 'sales', 0, now()),('Tom', 'Spears', 'tom@yahoo.com', '123456', 'Massachusetts', 'sales', 0, now());
SELECT first_name, last_name FROM users;
SELECT * from users WHERE location='Massachusetts' AND dept='sales';
SELECT * from users WHERE location='Massachusetts';
SELECT * FROM users WHERE is_admin > 0;
DELETE FROM users WHERE id=12;
UPDATE users SET email = 'freddy@gmail.com' WHERE id =2;
ALTER TABLE users ADD age VARCHAR(3);
ALTER TABLE users MODIFY COLUMN age INT(3);
SELECT * FROM users ORDER BY last_name ASC;
SELECT * FROM users ORDER BY last_name DESC;
SELECT CONCAT(first_name, " ", last_name) AS 'Name', dept FROM users;
SELECT DISTINCT location FROM users;
SELECT * FROM users WHERE age BETWEEN 20 AND 30;
SELECT * FROM users WHERE dept LIKE 'de%';
SELECT * FROM users WHERE dept LIKE '%t';
SELECT * FROM users WHERE dept LIKE '%es%';
SELECT * FROM users WHERE dept NOT LIKE '%es%';
SELECT * FROM users WHERE dept IN('design','sales');
CREATE INDEX LIndex on users(location);
DROP INDEX LIndex on users;

CREATE TABLE posts(
	id INT auto_increment,
    user_id INT,
    title varchar(255),
    body TEXT(65000),
    publish_date DATETIME default current_timestamp,
    primary key(id),
    foreign key(user_id) REFERENCES users(id)
);

INSERT INTO posts(user_id, title, body) VALUES (1, 'Post One', 'This is post one'),(3, 'Post Two', 'This is post two'),(1, 'Post Three', 'This is post three'),(2, 'Post Four', 'This is post four'),(5, 'Post Five', 'This is post five'),(4, 'Post Six', 'This is post six'),(2, 'Post Seven', 'This is post seven'),(1, 'Post Eight', 'This is post eight'),(3, 'Post Nine', 'This is post none'),(4, 'Post Ten', 'This is post ten');
SELECT * from posts;
SELECT
users.first_name,
users.last_name,
posts.title,
posts.publish_date
FROM users
INNER JOIN posts
ON users.id = posts.user_id
ORDER BY posts.title;

CREATE TABLE comments(
id INT AUTO_INCREMENT,
post_id INT,
user_id INT,
body TEXT,
publish_date DATETIME default current_timestamp,
primary key(id),
foreign key(post_id) references posts(id),
foreign key(user_id) references users(id)
);
INSERT INTO comments(post_id, user_id, body) VALUES (1, 3, 'This is comment one'),(2, 1, 'This is comment two'),(5, 3, 'This is comment three'),(2, 4, 'This is comment four'),(1, 2, 'This is comment five'),(3, 1, 'This is comment six'),(3, 2, 'This is comment six'),(5, 4, 'This is comment seven'),(2, 3, 'This is comment seven');

select * from comments;
SELECT
comments.body,
posts.title
FROM comments
RIGHT JOIN posts ON posts.id = comments.post_id
ORDER BY posts.title;

SELECT
comments.body,
posts.title,
users.first_name,
users.last_name
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
INNER JOIN users ON users.id = comments.user_id
ORDER BY posts.title;


SELECT COUNT(id) FROM comments;
SELECT MAX(age) FROM users;
SELECT MIN(age) FROM users;
SELECT SUM(age) FROM users;
SELECT UCASE(first_name), lcase(last_name) from users;
SELECT location, COUNT(location) FROM users group by location;
SELECT location, COUNT(location) FROM users WHERE location='Massachusetts' group by location ;


