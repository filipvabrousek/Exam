## SQL

### Create
* proc :)
```sql
CREATE DATABASE S;

CREATE TABLE Users(
id int PRIMARY KEY not null,
name varchar(50) not null,
age int not null
);

CREATE TABLE Photos(
uid int PRIMARY KEY,
photo BLOB
);

INSERT INTO Users
VALUES (1, "Filip", 20), (2, "Sofi", 21)

INSERT INTO Photos
VALUES (1, "...");

SELECT * FROM Users WHERE id = 1
SELECT Photos.photo FROM Photos LEFT JOIN Users ON Users.id = Photos.uid WHERE Users.id = 1;
SELECT Count(*) FROM Users;
SELECT AVG(age) FROM Users;


CREATE TABLE Changes(
uid int not null,
d date not null
);



CREATE TRIGGER X AFTER UPDATE 
ON Photos 
FOR EACH ROW
INSERT INTO Changes(uid, d) 
VALUES (uid, GETDATE())

-- ???
UPDATE Users SET name = "D" WHERE id = 1;
```
