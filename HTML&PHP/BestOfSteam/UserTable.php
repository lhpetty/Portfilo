<?php
$user = ' ';
$password = ' ';
$db = 'BestOfDB';

$db = new mysqli('localhost', $user, $password, $db) or die("try again");

// sql to create table
$sql = "CREATE TABLE User (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(30) NOT NULL,
userpassword VARCHAR(30),
reg_date TIMESTAMP
)";

if ($db->query($sql) === TRUE) {
    echo "Table User created successfully";
} else {
    echo "Error creating table: " . $db->error;
}

echo"Great work";
$db->close();


?>