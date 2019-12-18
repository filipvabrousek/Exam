## SQL

### Create
* missing: Procedures

```sql
CREATE DATABASE S;

CREATE TABLE Users(
id int PRIMARY KEY not null,
name varchar(50) not null,
age int not null
);

CREATE TABLE Changes(
uid int not null,
d date not null
);


CREATE TRIGGER BG AFTER INSERT 
ON Users 
FOR EACH ROW
INSERT INTO Changes(uid, d) 
VALUES (id, GETDATE());

INSERT INTO Users(id, name, age)
VALUES (1, "Filip", 20);



CREATE TABLE Photos(
uid int PRIMARY KEY,
photo BLOB
);


INSERT INTO Photos
VALUES (1, "...");


CREATE VIEW V AS 
SELECT * FROM Users
WHERE age > 18;

SELECT * FROM Users WHERE id = 1
SELECT Photos.photo FROM Photos LEFT JOIN Users ON Users.id = Photos.uid WHERE Users.id = 1;
SELECT Count(*) FROM Users;
SELECT AVG(age) FROM Users;

SELECT * FROM Users WHERE name LIKE "F%";
SELECT * FROM Users WHERE name IN ("Filip", "Petr");
SELECT TOP 10 FROM Users;

-- same number of columns !!!
SELECT uid FROM Users 
UNION 
SELECT uid FROM Photos;

UPDATE Users SET name = "D" WHERE id = 1;

BACKUP DATABASE D TO DISK = "path";
```
