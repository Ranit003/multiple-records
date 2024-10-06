<?php
include('dbconnection.php');

if(isset($_POST["pname"])){
    $pname = $_POST["pname"];
} else {
    return;
}

if(isset($_POST["pemail"])){
    $pemail = $_POST["pemail"];
} else {
    return;
}

if(isset($_POST["pphone1"])){
    $pphone1 = $_POST["pphone1"];
} else {
    return;
}

if(isset($_POST["pphone2"])){
    $pphone2 = $_POST["pphone2"];
} else {
    return;
}

if(isset($_POST["paddress1"])){
    $paddress1 = $_POST["paddress1"];
} else {
    return;
}

if(isset($_POST["paddress2"])){
    $paddress2 = $_POST["paddress2"];
} else {
    return;
}

if(isset($_POST["user_id"])){
    $user_id = $_POST["user_id"];
} else {
    return;
}

// Correcting the SQL queries
$q1 = "UPDATE `user_address` SET `address1`='$paddress1', `address2`='$paddress2' WHERE `user_id`='$user_id'";
$e1 = mysqli_query($con, $q1);

$q2 = "UPDATE `user_phone` SET `phone1`='$pphone1', `phone2`='$pphone2' WHERE `user_id`='$user_id'";
$e2 = mysqli_query($con, $q2);

$q3 = "UPDATE `user` SET `Name`='$pname', `email`='$pemail' WHERE `user_id`='$user_id'";
$e3 = mysqli_query($con, $q3);

$arr = [];
if($e3){
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}
print(json_encode($arr));
?>
