<?php
include('dbconnection.php');

$quer="SELECT * FROM user_address ua INNER JOIN user ut on ut.user_id=ua.user_id 
INNER JOIN user_phone up on ut.user_id=up.user_id";


$arr=[];

$exe=mysqli_query($con,$quer);
while($row=mysqli_fetch_array($exe)){
    $arr[]=$row;
}

print(json_encode($arr));

?>