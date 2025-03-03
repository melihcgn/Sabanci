<?php 

include "connection.php";

?>

<form action="delete.php" method="POST">
<select name="ids">

<?php

$sql_command = "SELECT dig, price, dname, ratings FROM drugs";

$myresult = mysqli_query($db, $sql_command);

    while($id_rows = mysqli_fetch_assoc($myresult))
    {
        $drug_id = $row['dig']; 
        $drug_price = $row['price']; 
        $drug_name = $row['dname']; 
        $drating = $row['ratings']; 
        echo "<option value=$drug_id>". $drug_price . " - " . $drug_name. " - " . $drating . "</option>";
    }

?>

</select>
<button>DELETE</button>
</form>