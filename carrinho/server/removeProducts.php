<?php
  include "../../php/database.php";
  $dt = json_decode(file_get_contents('php://input'), true);
  $id = $dt['userId'];
  $productId = $dt['id'];
  
  try {
    $sql = "SELECT * FROM carrinho WHERE id_user = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);
    $results = $stmt->fetch(PDO::FETCH_ASSOC);
    $json = json_encode($results);
    $json = json_decode($json);
    $cart = json_decode($json->content);
    $array = get_object_vars($cart);
    $properties = array_keys($array);
    foreach ($cart as $key => $value) {
      if ($key == $productId) {
        $qtd = $value->qtd;
        $value->qtd = $qtd - 1;
        if ($value->qtd <= 0) {
          unset($cart->$key);
        }
      }
    }
    $content = json_encode($cart);
    $sql = "UPDATE carrinho SET content = ? WHERE id_user = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$content, $id]);

    echo json_encode($cart);

  
  } catch (\Throwable $th) {
    //throw $th;
  }