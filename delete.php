<?php

include('dbconnection.php');


if(isset($_POST["userid"]))

{
    $userid=$_POST["userid"];
}

else return;


$q1="DELETE FROM `user_address` WHERE user_id='$userid'"; 
$e1=mysqli_query($con,$q1);

$q2="DELETE FROM `user_phone` WHERE user_id='$userid'";
$e2=mysqli_query($con,$q2);

$q3="DELETE FROM `user` WHERE user_id='$userid'"; 
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