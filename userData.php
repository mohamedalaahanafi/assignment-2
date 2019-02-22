<?php

class userControl
{
    static function showUserData($ID)
    {
        $Connection = new mysqli("localhost", "root", "", "se");
 $sql = "SELECT * FROM uservalues WHERE userID = ".$ID;
 $result = mysqli_query($Connection, $sql);

 $sql1 = "SELECT * FROM user WHERE ID = ".$ID;
 $result1 = mysqli_query($Connection, $sql1);
 $user = mysqli_fetch_array($result1);
 echo "user name: ".$user["full name"]." <br>";

    while($Row = mysqli_fetch_array($result))
	{
        $sql2 = "SELECT * FROM usertypeattributes WHERE ID = ".$Row["uniqueUserAttributeID"];
        $result2 = mysqli_query($Connection, $sql2);
        $attributeID = mysqli_fetch_array($result2); //getting attribute ID from usertypeattributes
        
        $sql3 = "SELECT * FROM attribute WHERE ID = ".$attributeID["attributeID"];
        $result3 = mysqli_query($Connection, $sql3);
        $attribute = mysqli_fetch_array($result3);

        $sql4 = "SELECT * FROM usertype WHERE ID = ".$attributeID["userTypeID"];
        $result4 = mysqli_query($Connection, $sql4);
        $userType = mysqli_fetch_array($result4);



        if($attribute["type"] == "text")
        {
            echo $attribute["attributeName"].": ".$Row["value"]." (".$userType["type"].")";
            echo "<br>";
        }


    }
    }
}


?>