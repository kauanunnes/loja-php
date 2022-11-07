<?php
include '../php/database.php';
$dt = json_decode(file_get_contents('php://input'), true);
$id = $dt['id'];
try {
  $sql = "SELECT id, nome, email FROM user WHERE id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->execute([$id]);
  $results = $stmt->fetch(PDO::FETCH_ASSOC);
  $json = json_encode($results);

} catch (\Throwable $th) {
  //throw $th;
}

echo $json;