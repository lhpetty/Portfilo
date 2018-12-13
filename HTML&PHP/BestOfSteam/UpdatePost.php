<?php

$user = "root";
$password = "";
$db = "BestOfDB";
global $id, $username, $title, $category, $screenshot, $result;
session_start();
$db = mysqli_connect("localhost", $user, $password, $db);


if(!isset($_REQUEST['submit']))
{
	
	
	$username = mysqli_real_escape_string($db, $_REQUEST['username']);
	$title = mysqli_real_escape_string($db, $_REQUEST['title']);
	$category = mysqli_real_escape_string($db, $_REQUEST['category']);
	$screenshot = mysqli_real_escape_string($db, $_REQUEST['screenshot']);




if(mysqli_connect_errno())
{
	echo "Failed to connect" .mysqli_connect_error();
}
if(!$db) 
{
	echo '????';
}


$fetchuser = "SELECT username, count(*) as NUM FROM 'Post' GROUP BY username";
$countresult = mysqli_query($db, $fetchuser);
$resultcount = $countresult;



if($resultcount > 0)
{
	mysqli_query($db, "UPDATE 'Post' SET 'username' = '$username', 'title' = '$title', 'category' = '$category', 'screenshot' = '$screenshot' WHERE 'id' = '$id'") or die("error in updating");
}
else
{
$sql = "INSERT INTO Post (username, title, category, screenshot) VALUES ('$username', '$title', '$category','screenshot')";
}

if ($db->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $db->error;
}

}