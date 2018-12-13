<?php
$user = 'root';
$password = '';
$db = 'BestOfDB';

$db = new mysqli('localhost', $user, $password, $db) or die("try again");

// sql to create table
$sql = "CREATE TABLE Post (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(30) NOT NULL,
title VARCHAR(30),
category VARCHAR(30),
screenshot LONGBLOB NOT NULL,
reg_date TIMESTAMP
)";

if ($db->query($sql) === TRUE) {
    echo "Table Post created successfully";
} else {
    echo "Error creating table: " . $db->error;
}

echo"Great work";
$db->close();


?>