<?php 

include "connection.php"; 

if (!empty($_POST['dig'])){ 
    $dig = $_POST['dig']; 
    $price = $_POST['price']; 
    $dname = $_POST['dname']; 
    $ratings = $_POST['ratings']; 
    $sql_statement = "INSERT INTO drugs(dig, price, dname, ratings) VALUES ($dig, $price, '$dname',$ratings)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 


if (!empty($_POST['uid'])){ 
    $uid = $_POST['uid']; 
    $email = $_POST['email']; 
    $password = $_POST['password']; 
    $nickname = $_POST['nickname']; 
    $sql_statement = "INSERT INTO users(uid, email, upassword, nickname) VALUES ($uid, '$email', '$password','$nickname')"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['bid'])){ 
    $bid = $_POST['bid']; 
    $totalPrice = $_POST['totalPrice']; 
  
    $sql_statement = "INSERT INTO basket(Total_price, bid) VALUES ($bid, $totalPrice)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['shipid'])){ 
    $shipid = $_POST['shipid']; 
    $shipDate = $_POST['shipDate']; 
    $shipName = $_POST['shipName'];
    $shipPrice = $_POST['shipPrice'];

    $sql_statement = "INSERT INTO shipment(shipid, shipment_date, company_name, ship_price) VALUES ($shipid, $shipDate,'$shipName', $shipPrice)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 

if (!empty($_POST['user_id'])){ 
    $uid = $_POST['user_id']; 
    $srating = $_POST['srating']; 


    $sql_statement = "INSERT INTO seller(user_id, srating) VALUES ($uid, $srating)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['user_id2'])){ 
    $uid = $_POST['user_id2']; 
    $baddress = $_POST['baddress']; 
    

    $sql_statement = "INSERT INTO buyer(user_id, baddress) VALUES ($uid, '$baddress')"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['oid1'])){ 
    $oid = $_POST['oid1']; 
    $odate = $_POST['o_date']; 


    $sql_statement = "INSERT INTO orders(oid, o_date) VALUES ($oid, '$odate')"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 

if (!empty($_POST['shipid'])){ 
    $shipid = $_POST['shipid']; 
    $uid = $_POST['user_id3']; 


    $sql_statement = "INSERT INTO sets_up(shipid, user_id) VALUES ($shipid, $uid)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['user_id4'])){ 
    $uid = $_POST['user_id4']; 
    $dig = $_POST['dig2']; 


    $sql_statement = "INSERT INTO buys(user_id, dig) VALUES ($uid, $dig)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['user_id5'])){ 
    $user_id = $_POST['user_id5']; 
    $oid = $_POST['oid2']; 


    $sql_statement = "INSERT INTO gives(user_id, oid) VALUES ($user_id,$oid)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['oid3'])){ 
    $oid = $_POST['oid3']; 
    $bid = $_POST['bid2']; 


    $sql_statement = "INSERT INTO inside_of(bid, oid) VALUES ($bid, $oid)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['user_id6'])){ 
    $uid = $_POST['user_id6']; 
    $dig = $_POST['dig3']; 


    $sql_statement = "INSERT INTO sells(user_id, dig) VALUES ($uid, $dig)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 
if (!empty($_POST['user_id7'])){ 
    $uid = $_POST['user_id7']; 
    $oid = $_POST['oid4']; 


    $sql_statement = "INSERT INTO takes(user_id, oid) VALUES ($uid, $oid)"; 

    $result = mysqli_query($db, $sql_statement);
    echo "Your result is: " . $result;
} 

?>
