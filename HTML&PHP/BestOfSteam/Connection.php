<?php
$user = ' ';
$password = ' ';


$db = new mysqli('localhost', $user, $password) or die("try again");

$sql = "CREATE DATABASE BestOfDB";
if($db->query($sql)=== TRUE)
{
	echo "Database created ";
}
else
{
	echo "try again";
}
echo"Great work";



?>