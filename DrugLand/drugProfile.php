<?php
include "navbar.html";

include "connection.php"; // Makes mysql connection
$adana = $_GET['name1'];
echo  "<h1  style='text-align: center' font-size:20vw > Profile of " .$adana ."</h1><br>";
$sql_statement = "SELECT  SE.nickname, S.user_id , S.dig, SH.ship_price, SH.company_name, 
SH.shipment_date FROM sells S, users SE, shipment SH WHERE S.user_id = SE.uid AND S.dig IN 
(SELECT D2.dig FROM drugs D2 WHERE D2.dname = '$adana')";


//SELECT S.user_id , S.dig FROM sells S INNER JOIN drugs D ON D.dig = S.Dig AND D.dig IN (SELECT D2.dig FROM drugs D2 WHERE D2.dname = "parol")

$sql_statement2 = "SELECT D.price FROM drugs D WHERE D.dname = '$adana'";
$result2 = mysqli_query($db, $sql_statement2);
$row2 = mysqli_fetch_assoc($result2);
$dprice = $row2['price'];

$result = mysqli_query($db, $sql_statement);
while ($row = mysqli_fetch_assoc($result)) { // Iterating the result    
    $shdate = $row['shipment_date'];
    $sellerNickname = $row['nickname'];
    $user = $row['user_id'];
    $dig = $row['dig'];
    $sp = $row['ship_price'];
    $cp = $row['company_name'];
    $total = $sp + $dprice;
    echo "<div class='column' style= 'text-align: center' ><h1 font-size:1vw ><a href=sellerProfile.php?name2=$sellerNickname>" . $sellerNickname . 
    "</a></h1><br>". "<a href=addToBasket.php?dig=$dig&total=$total&shdate=$shdate&sid=$user> Add to My Basket   </a><br> seller id:  "  
    . " ".$user . "<br> drug id: " . $dig . "<br> shipment company: ". $cp ." <br>price: " . ($sp + $dprice) ."<br></div>";
}



?>





