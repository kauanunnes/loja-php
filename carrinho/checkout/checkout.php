<?php
  include "../../php/database.php";
  $dt = json_decode(file_get_contents('php://input'), true);
  $formData = $dt['formData'];
  $userId = $dt['userId'];

  try {
    $tipo = $formData["tipo"];
    $valor_total = $formData["valor_total"];
    $today = date("Y-m-d H:i:s"); 
    $sql = "INSERT INTO pagamento (tipo_pagamento, confirmacao) VALUES (?, 1)";
    $conn->prepare($sql)->execute([$tipo]);

    $sql = "SELECT id FROM pagamento ORDER BY id DESC LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetch(PDO::FETCH_ASSOC);
    $payId = $results["id"];
    $sql = "INSERT INTO venda (user_id, pagamento_id, valor_total, data_venda) VALUES (?, ?, ?, ?)";
    $conn->prepare($sql)->execute([$userId, $payId, $valor_total, $today]);

    $sql = "UPDATE carrinho SET content = '{}' WHERE id_user = ?";
    $conn->prepare($sql)->execute([$userId]);

    echo json_encode(["msg"=>"Compra realizada com sucesso."]);

  
  } catch (\Throwable $th) {
    echo json_encode(["msg"=>"Ocorreu algum erro ao tentar finalizar sua compra."]);
    //throw $th;
  }