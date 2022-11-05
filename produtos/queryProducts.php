<?php
include '../php/database.php';
try {
  $sql = "SELECT * FROM produto";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $json = json_encode($results);

} catch (\Throwable $th) {
  //throw $th;
}

echo $json;