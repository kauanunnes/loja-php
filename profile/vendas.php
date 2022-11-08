<?php
include '../php/database.php';
$dt = json_decode(file_get_contents('php://input'), true);
$id = $dt['id'];
try {
  $sql = "SELECT venda.*, pagamento.tipo_pagamento, pagamento.confirmacao FROM venda INNER JOIN pagamento ON venda.pagamento_id = pagamento.id WHERE user_id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->execute([$id]);
  $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $json = json_encode($results);
} catch (\Throwable $th) {
  //throw $th;
}

echo $json;