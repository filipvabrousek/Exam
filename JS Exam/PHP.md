# PHP


```php
<?php

$conn = mysqli_connect("localhost", "root", "mysql");
mysqli_query($conn, "CREATE DATABASE Learning");

$conno = mysqli_connect("localhost", "root", "mysql", "Learning");
mysqli_query($conno, "CREATE TABLE Students (email varchar(255), age int)");
mysqli_query($conno, "INSERT INTO Students (email, age) VALUES ('filip@a.com', '19')");

$res = mysqli_query($conno, "SELECT email FROM Students");


if (mysqli_num_rows($res) > 0){
    while($row = mysqli_fetch_assoc($res)){
        print("<p>Hello ".$row["email"]."</p>");
    }
}



$text = "I am here";
print(strlen($text)); // 9

$arr = array("Filip", "Petr");
print($arr[0]); // Filip





/*
if ($conn->query($sql) === TRUE){
    print("DATABASE CRATED.");
} else {
    print("ERROR CREATING DATABSE: ". $conn->error);
}
*/

?>

```
