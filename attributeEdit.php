<?php
include_once "attribute.php";
$object = new attribute();
$object->update($_POST["attributeName"],$_POST["attributeDType"]);
?>