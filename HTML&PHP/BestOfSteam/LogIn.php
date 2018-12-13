<?php

$server = "localhost";
$user = "";
$password = "";
$db = "BestOfDB";
global $id, $username, $userpassword, $result;
session_start();
$db = mysqli_connect("localhost", $user, $password, $db);


if(!isset($_REQUEST['submit']))
{
	$username = mysqli_real_escape_string($db,$_REQUEST['username']);
	$userpassword = mysqli_real_escape_string($db,$_REQUEST['userpassword']);
	
	//$sql = "SELECT id FROM 'User' WHERE' username = '$username' and userpassword = '$userpassword'";
	$fetchuser = "SELECT username, count(*) as NUM FROM 'User' GROUP BY username";
	$countresult = mysqli_query($db,$fetchuser);
	//$row = mysqli_fetch_array($countresult);
	//$active = $row['active'];
	$resultcount = $countresult;
	
	//$count = mysqli__num_rows($result);
	
	if($resultcount == 1)
	{
		session_register("username");
		$_SESSION['login_user'] = $username;
		echo "log in successfully";
	}
	else
	{
		$error = "didnt work";
	}
}
	
?>