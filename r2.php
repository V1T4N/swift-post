<?php
try {
$pdo = new PDO('mysql:dbname=url;host=localhost;charset=utf8','root','',
array(PDO::ATTR_EMULATE_PREPARES => false));

$id = 1111;
$url = "test";

$stmt = $pdo -> prepare("INSERT INTO test(id,url) VALUES (:id,:url)");


$stmt->bindParam(':id', $id, PDO::PARAM_INT);
$stmt->bindValue(':url', $url, PDO::PARAM_STR);

$stmt -> execute();


} catch (PDOException $e) {
 exit('ERROR'.$e->getMessage());
}
?>