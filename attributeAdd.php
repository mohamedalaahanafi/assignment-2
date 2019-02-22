<?php
include_once "attribute.php";
$object = new attribute();
$object->add($_POST["attributeName"],$_POST["attributeDType"]);


?>