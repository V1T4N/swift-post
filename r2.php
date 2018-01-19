<?php
try { // try-catchでエラー取得


$pdo = new PDO('mysql:dbname=url;host=localhost;charset=utf8','root','',
array(PDO::ATTR_EMULATE_PREPARES => false));

$id1 = $_POST["id"];        //swiftから送られてくるディクショナリー型変数を取得　配列中のStringがKey 
$pass1 = $_POST["pass"];
$url1 = $_POST["url"];


$stmt = $pdo -> prepare("INSERT INTO test(id,pass,url) VALUES (:id,:pass,:url)");


$stmt->bindValue(':id', $id1, PDO::PARAM_STR);
$stmt->bindValue(':pass', $pass1, PDO::PARAM_STR);
$stmt->bindValue(':url', $url1, PDO::PARAM_STR);

$stmt -> execute(); //INSERT実行


} catch (PDOException $e) {
 exit('ERROR'.$e->getMessage());
}
?>