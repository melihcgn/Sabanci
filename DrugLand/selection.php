<?php

include "connection.php";

if (!empty($_POST['sprc']) && !empty($_POST['lprc'])){
    
$sprice = $_POST['sprc'];
$lprice = $_POST['lprc'];

$sql_statement = "SELECT * FROM drugs WHERE price < $lprice AND price > $sprice";
$result = mysqli_query($db, $sql_statement);
echo "LİSTİNG SELECTED DRUGS <br> <br>";
while($row = mysqli_fetch_assoc($result)) { // Iterating the result
    $drug_id = $row['dig']; 
    $drug_price = $row['price']; 
    $dname = $row['dname']; 
    $ratings = $row['ratings'];
    echo $drug_id . " " . $drug_price . " " . $dname . " ".$ratings ."<br>"; 
  } 
}