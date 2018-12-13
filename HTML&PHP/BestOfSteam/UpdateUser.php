<?php

$user = " ";
$password = " ";
$db = "BestOfDB";
global $id, $username, $userpassword, $result;
session_start();
$db = mysqli_connect("localhost", $user, $password, $db);
/*if(isset($_POST["id"]))
{
	$id = $_POST['id'];
	echo $id;
}
else 
{
	echo "failed to create new id";
}

if(isset($_POST["username"]))
{
	$username = $_POST['username'];
	echo $username;
	echo "this is the user";
}

else
{
	$username = null;
	echo "failed to get a username";
}

if(isset($_POST["userpassword"]))
{
	$password = $_POST['userpassword'];
	echo $userpassword;
}
else
{
	$password = null;
	echo "failed to create password";
}
*/

if(!isset($_REQUEST['submit']))
{
	/*$username = stripslashes($_POST['username']);
	$username = mysqli_real_escape_string($db,$username);
	
	$userpassword = stripslashes($_POST['userpassword']);
	$userpassword = mysqli_real_escape_string($db,$userpassword);*/
	
	/*$id = $_POST['id'];
	echo $id;
	$username = $_POST['username'];
	echo $username;
	$userpassword = $_POST['userpassword'];
	echo $userpassword;
	
	return $id;
	return $username; 
	return $password;*/
	
	$username = mysqli_real_escape_string($db, $_REQUEST['username']);
	$userpassword = mysqli_real_escape_string($db, $_REQUEST['userpassword']);




if(mysqli_connect_errno())
{
	echo "Failed to connect" .mysqli_connect_error();
}
if(!$db) 
{
	echo '????';
}

//$sql = "SELECT 'username', 'userpassword' FROM 'User' Where 'id' = $id";
//$sql = "INSERT INTO User (id, username, userpassword) VALUES ('$id', '$username', ' $userpassword')";
//$result = mysqli_query($db, $sql);
$fetchuser = "SELECT username, count(*) as NUM FROM 'User' GROUP BY username";
$countresult = mysqli_query($db, $fetchuser);
$resultcount = $countresult;

//if( false === $result)
//{
//	printf("error: ", mysqli_error($db));
//}
//else 
//{
//	echo "complete";
//}
//if(!$result)
//{
//	echo "error";
//}
//else
//{
//	echo "yay";
//}
//$result = $mysqli->query("SELECT * FROM 'User' where 'id' = $id");
//$count = $result->num_rows;

if($resultcount > 0)
{
	mysqli_query($db, "UPDATE 'User' SET 'username' = '$username', 'userpassword' = '$userpassword' WHERE 'id' = '$id'") or die("error in updating");
}
else
{
$sql = "INSERT INTO User (username, userpassword) VALUES ('$username', '$userpassword')";
}

if ($db->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $db->error;
}

}


/*if($_server["REQUEST_METHOD"] == "POST")
{
	$username = mysqli_real_escape_string($db,$_POST['username']);
	$userpassword = mysqli_real_escape_string($db,$_POST['userpassword']);
	
	$sql = "SELECT id FROM 'User' WHERE' username = '$username' and userpassword = '$userpassword'";
	$result = mysqli_query($db,$sql);
	$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
	$active = $row['active'];
	
	$count = mysqli__num_rows($result);
	
	if($count == 1)
	{
		session_register("username");
		$_SESSION['login_user'] = $username;
		echo "log in successfully";
	}
	else
	{
		$error = "didnt work";
	}
}*/
	
?>