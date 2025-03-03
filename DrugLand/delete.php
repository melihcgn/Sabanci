<?php

include "connection.php";

if(!empty($_POST['digs']))
{
    $dig = $_POST['digs'];
    $sql_statement = "DELETE FROM drugs WHERE dig = $dig";
    $result = mysqli_query($db, $sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['uid']))
{
    $dig = $_POST['uid'];
    $user_sql_statement = "DELETE FROM users WHERE uid = $dig";
    $result = mysqli_query($db, $user_sql_statement);
    echo "Your result is " . $result;
}

if(!empty($_POST['bid']))
{
    $bid = $_POST['bid'];
    $basket_sql_statement = "DELETE FROM basket WHERE bid = $bid";
    $result = mysqli_query($db, $basket_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['shipid']))
{
    $shipid = $_POST['shipid'];
    $shipment_sql_statement = "DELETE FROM shipment WHERE shipid = $shipid";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}

if(!empty($_POST['user_id']))
{
    $user_id = $_POST['user_id'];
    $shipment_sql_statement = "DELETE FROM seller WHERE user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['user_id2']))
{
    $shipid = $_POST['user_id2'];
    $shipment_sql_statement = "DELETE FROM buyer WHERE user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['oid']))
{
    $oid = $_POST['oid'];
    $shipment_sql_statement = "DELETE FROM orders WHERE oid = $oid";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}

if(!empty($_POST['shipid2']) && !empty($_POST['user_id3']) )
{
    $shipid = $_POST['shipid2'];
    $user_id = $_POST['user_id3'];

    $shipment_sql_statement = "DELETE FROM sets_up WHERE oid = $oid AND user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['user_id4']) && !empty($_POST['dig']) )
{
    $dig = $_POST['dig'];
    $user_id = $_POST['user_id4'];

    $shipment_sql_statement = "DELETE FROM buys WHERE dig = $dig AND user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['oid2']) && !empty($_POST['user_id5']) )
{
    $oid = $_POST['oid2'];
    $user_id = $_POST['user_id5'];

    $shipment_sql_statement = "DELETE FROM gives WHERE oid = $oid AND user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['bid2']) && !empty($_POST['oid3']) )
{
    $oid = $_POST['oid3'];
    $bid = $_POST['bid2'];

    $shipment_sql_statement = "DELETE FROM inside_of WHERE oid = $oid AND bid = $bid";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['dig']) && !empty($_POST['user_id6']) )
{
    $dig = $_POST['dig'];
    $user_id = $_POST['user_id6'];

    $shipment_sql_statement = "DELETE FROM sells WHERE dig = $dig AND user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}
if(!empty($_POST['oid4']) && !empty($_POST['user_id7']) )
{
    $oid = $_POST['oid4'];
    $user_id = $_POST['user_id7'];

    $shipment_sql_statement = "DELETE FROM takes WHERE oid = $oid AND user_id = $user_id";
    $result = mysqli_query($db, $shipment_sql_statement);
    echo "Your result is " . $result;
}

?>