<?php

$db = mysqli_connect('localhost','root','','EduConsult');
if(!$db)
{
    echo "Database Connection Failed!";
}
// $name = "Sandesh";
// $email = "sandesh@gmail.com";
// $mob = "7798357047";
// $state = "Maharastra";


$username = $_POST['Username'];
$password = $_POST['Password'];

// $username = "sandesh";
// $password = "sandesh30";

$query = "SELECT * FROM login WHERE Username = '$username' and Password = '$password' ";

$res = mysqli_query($db,$query);
$count = mysqli_num_rows($res);

if($count > 0)
{
    echo json_encode("true");
}
else
{
   echo json_encode("false");
}

?>
