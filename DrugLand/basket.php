<?php
include "navbar.html";
include "connection.php";

$printSQL = "SELECT B.Total_price, I.bid, I.oid FROM inside_of I, basket B WHERE B.bid = 2000";
echo  "<h1  style='text-align: center' font-size:20vw > My Basket </h1><br>";

$result = mysqli_query($db, $printSQL);
while ($row = mysqli_fetch_assoc($result)) { // Iterating the result    
    $bid = $row['bid'];
    $oid = $row['oid'];
    $bprice = $row['Total_price'];
    echo "<div style= 'text-align: center' ><br>TOTAL PRİCE: ORDERED-Basket id: " .$bid . " order id: " . $oid . "</div><br>";

}
echo "<h3 style= 'text-align: center' ><br>TOTAL PRİCE: ". $bprice. "</h2> ";
?>