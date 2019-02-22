<?php
 include_once "userData.php";
include_once "attribute.php";
include_once "userValues.php";
include_once "userTypeAttr.php";
$object = new userControl();
$object->showUserData(1);
 
// $attr=new attribute('ew3a','int');
// $attr->delete(10);
// $attr->read();
// $attr->update(1,'mo7y','shar2awy');

//  $val=new userVal(3,'weshak',1);
// // $val->delete(4);
// // $val->read(2);
//  $val->update(1,5,'kiks');

$typeattr=new userTypeAttr(2,4);
$typeattr->delete(2);
$typeattr->read(2);
$typeattr->update(3,2,23);
?>