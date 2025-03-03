<?php
include "connection.php"; // Makes mysql connection
include "navbar.html";
$adana = $_GET['name2'];
echo  "<h1  style='text-align: center' font-size:20vw > Seller Profile:  " .$adana ."</h1><br>";
$adana;


$sql_statement = "SELECT * FROM users U, Seller S WHERE U.uid = S.user_id AND  U.nickname = '$adana'";
$result = mysqli_query($db, $sql_statement); // Executing query

while ($row = mysqli_fetch_assoc($result)) { // Iterating the result
                
    $userid = $row['user_id'];
    $srating = $row['srating'];
    $email = $row['email'];
    

    echo "<div   style='text-align: center' ><div class=wrapper-2>
    <br>id: ". $userid .
      " </h1><br>rating: " . $srating . "<br>email: " . $email . " </div><br>";
    

}




?>