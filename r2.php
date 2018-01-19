<?php
try { // try-catchでエラー取得


$pdo = new PDO('mysql:dbname=url;host=localhost;charset=utf8','root','',
array(PDO::ATTR_EMULATE_PREPARES => false));

$id = $_POST["id"];     //swiftから送られてくるディクショナリー型変数を取得　配列中のStringがKey
$url = $_POST["url"];

$stmt = $pdo -> prepare("INSERT INTO test(id,url) VALUES (:id,:url)");


$stmt->bindParam(':id', $id, PDO::PARAM_STR);
$stmt->bindValue(':url', $url, PDO::PARAM_STR);

$stmt -> execute(); //INSERT実行


} catch (PDOException $e) {
 exit('ERROR'.$e->getMessage());
}
?>