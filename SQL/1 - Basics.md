## SQL

## Create
```sql
CREATE DATABASE S;

CREATE TABLE Users (
id int PRIMARY KEY not null,
name varchar(50) not null,
age int not null
);

CREATE TABLE Photos(
uid int PRIMARY KEY,
photo BLOB
);

CREATE VIEW V AS 
SELECT * FROM Users
WHERE age > 18;

CREATE INDEX idx ON Users(age);
```

## Insert
```sql
INSERT INTO Photos
VALUES (1, "...");

INSERT INTO Users(id, name, age)
VALUES (1, "Filip", 20);
```

## Select
```sql
SELECT * FROM Users WHERE id = 1
SELECT Photos.photo FROM Photos LEFT JOIN Users ON Users.id = Photos.uid WHERE Users.id = 1;
SELECT Count(*) FROM Users;
SELECT AVG(age) FROM Users;

SELECT * FROM Users WHERE name LIKE "F%";
SELECT * FROM Users WHERE name IN ("Filip", "Petr");
SELECT TOP 10 FROM Users;

SELECT * FROM Users GROUP BY age

-- same number of columns;
SELECT uid FROM Users 
UNION 
SELECT uid FROM Photos;
```

## Switch
```sql
SELECT age, 
CASE 
WHEN age > 20 THEN "Old"
ELSE "Hey"
END AS r
FROM Users
```

## Not working in my DB
```sql
CREATE PROCEDURE Fetch()
BEGIN
SELECT * FROM Usersa
END; 

CREATE TRIGGER BGX AFTER INSERT 
ON Usersa
FOR EACH ROW
INSERT INTO Changes(uid, d) 
VALUES (id, GETDATE());

CREATE TABLE Changes(
uid int not null,
d date not null
);
```


## Scalar functions

```sql

SELECT COS(3) AS x
SELECT CONCAT("Hey", "Filip")
SELECT REVERSE("Tutorial")
SELECT REPLICATE('Another', 3)
SELECT REPLACE("Milip", "M", "F")
SELECT STR(180) 
```

## Other
```sql
SELECT DATEDIFF('2018/07/23', '2019/06/23');
SELECT COALESCE(null, 3)


DECLARE @a INT
SET @a = 3
```
