<?php
include('dbconnection.php');

if(isset($_POST["pname"])){
    $pname=$_POST["pname"];
}
else return;

if(isset($_POST["pemail"])){
    $pemail=$_POST["pemail"];
}
else return;

if(isset($_POST["ppassword"])){
    $ppassword=$_POST["ppassword"];
}
else return;

if(isset($_POST["pphone1"])){
    $pphone1=$_POST["pphone1"];
}
else return;

if(isset($_POST["pphone2"])){
    $pphone2=$_POST["pphone2"];
}
else return;

if(isset($_POST["paddress1"])){
    $paddress1=$_POST["paddress1"];
}
else return;

if(isset($_POST["paddress2"])){
    $paddress2=$_POST["paddress2"];
}
else return;

$query="SELECT max(user_id) as ui FROM user_address";
$exe=mysqli_query($con,$query);

$row=mysqli_fetch_array($exe);
$user_id=$row["ui"];
$user_id=$user_id+1;


$q1="INSERT INTO `user_address`(`address1`, `address2`, `user_id`) VALUES ('$paddress1','$paddress2','$user_id')"; 
$e1=mysqli_query($con,$q1);

$q2="INSERT INTO `user_phone`( `phone1`, `phone2`, `user_id`) VALUES ('$pphone1','$pphone2', '$user_id')";
$e2=mysqli_query($con,$q2);

$q3="INSERT INTO `user`( `Name`, `email`, `password`, `user_id`) VALUES ('$pname','$pemail','$ppassword','$user_id')"; 
$e3=mysqli_query($con,$q3);

$arr=[];
if($e3){
    $arr["success"]="true";
}
else{
    $arr["success"]="false";
}
print(json_encode($arr));



?>