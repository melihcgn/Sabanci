<?php
# okeyy
$db = mysqli_connect('localhost','root','','drug_store');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>