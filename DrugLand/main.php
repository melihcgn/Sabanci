<?php include "navbar.html";                
 include "connection.php"; // Makes mysql connection
?>

<link rel="stylesheet" href="style.css" />
<div class="container"   >
    <div class="right">
        <div class="col-12" style="text-align: center">
            <?php
            if (isset($_POST['name'])) {

                $name = $_POST['name'];
                echo "<h2> Welcome to DrugLand </h2>";


            } else {
                echo "<h1> Welcome to DrugLand </h1>";
            }
            ?>
            
        </div>

        <div class="row" style="text-align: center">
            <div class="wrapper-2">
            <?php
            $sql_statement = "SELECT * FROM drugs";

            $result = mysqli_query($db, $sql_statement); // Executing query
            
            echo "<h1 style = font-size:2vw >All Buyable Drugs</h1><br>";
            while ($row = mysqli_fetch_assoc($result)) { // Iterating the result
                
                $drug_id = $row['dig'];
                $drug_price = $row['price'];
                $drug_name = $row['dname'];
                $drating = $row['ratings'];
                
               ?>
              
               <?php
                echo "<div class='wrapper-1' style= 'text-align: center'  ><div class= 'wrapper-3' ><h1 font-size:1vw >
                 <a href=drugProfile.php?name1=$drug_name>".$drug_name ."</a></h1><br>" . "id: ". $drug_id .
                  "<br>price: " . $drug_price . " TL<br>Name: " . $drug_name . "<br>Rating: " . $drating . "</div> </div><br>";
                
                ?>
              
                <?php

            }




            ?>
            </div>
        </div>

         <div class="row">

</div>
</div>