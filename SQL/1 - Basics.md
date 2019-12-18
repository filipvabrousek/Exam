## SQL

### Crete
```sql
CREATE DATABASE F

CREATE TABLE Users(
id int PRIMARY KEY not null,
name varchar(50) not null,
age int not null
)
```


### Select
```sql
SELECT * FROM D WHERE id = 1
SELECT name FROM D LEFT JOIN M ON name.id = other.id
```

### Other
```sql
UPDATE D SET name = "Filip" WHERE id = 1

```
