<?php include "navbarSeller.html";                
 include "connection.php"; // Makes mysql connection
?>

<link rel="stylesheet" href="style.css" />
<div class="container" >
    <div class="row">
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
            $sql_statement = "SELECT B.user_id, G.oid FROM buyer B, gives G WHERE G.user_id = B.user_id AND G.oid IN (SELECT T.oid FROM takes T WHERE T.user_id = 28426)";

            $result = mysqli_query($db, $sql_statement); // Executing query
            
            echo "<h1 style = font-size:2vw >WANTED ORDERS</h1><br>";
            while ($row = mysqli_fetch_assoc($result)) { // Iterating the result
                
                $uid = $row['user_id'];
                $oid = $row['oid'];
                
                

               
                echo "<div class='column' style='text-align: right'  ><div class= 'wrapper-2' ><h1 font-size:1vw >
                 buyer id: ".$uid ."</h1><br>" . "order id: ". $oid .
                 "<br>";
                

            }
          


            ?>
            </div>
        </div>

         <div class="row">

</div>
</div>