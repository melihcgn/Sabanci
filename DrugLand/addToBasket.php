<?php
include "navbar.html";
include "connection.php";
$dig = $_GET['dig'];
$totalPrice = $_GET['total'];
$shdate = $_GET['shdate'];
$sellerid = $_GET['sid'];


$sql_statement = "UPDATE `basket` SET `Total_price`= Total_price + $totalPrice WHERE bid = 2000";
$oidnum = $dig + $totalPrice;

$sql_statement_insert2 = "INSERT INTO `orders`(`oid`, `o_date`) VALUES ($oidnum,(3 + $shdate))";


$sql_statement_insert = "INSERT INTO `inside_of`(`bid`, `oid`) VALUES (2000,$oidnum)";

$sql_statement_insert_takes = "INSERT INTO `takes`(`user_id`, `oid`) VALUES ($sellerid, $oidnum)";

$sql_statement_insert_buys = "INSERT INTO `buys`(`user_id`, `dig`) VALUES (44444, $dig)";


$resultup = mysqli_query($db, $sql_statement);

$resultin2 = mysqli_query($db, $sql_statement_insert2);
$resultin1 = mysqli_query($db, $sql_statement_insert);
$resultinTakes = mysqli_query($db, $sql_statement_insert_takes);
$resultinBuys = mysqli_query($db, $sql_statement_insert_buys);

    echo "It is successfully added to your basket."


?>