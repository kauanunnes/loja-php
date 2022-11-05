<?php
  include "../../php/database.php";
  $dt = json_decode(file_get_contents('php://input'), true);
  $id = $dt['userId'];

  try {
    $sql = "SELECT * FROM carrinho WHERE id_user = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);
    $results = $stmt->fetch(PDO::FETCH_ASSOC);
    $json = json_encode($results);
    echo $json;
  //code...
  } catch (\Throwable $th) {
    //throw $th;
  }