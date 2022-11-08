<?php
  include '../php/database.php';
  $name = $_POST["name"];
  $cpf = $_POST["cpf"];
  $email = $_POST["email"];
  $password = $_POST["password"];
  
  
  // Check connection
  try {
    $sql = "INSERT INTO user (nome, cpf, email, senha) VALUES (?,?,?,?)";
    $conn->prepare($sql)->execute([$name, $cpf, $email, $password]);
    $sql = "SELECT id FROM user WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$email]);
    $results = $stmt->fetch(PDO::FETCH_ASSOC);
    $userId = $results["id"];
    $sql = "INSERT INTO carrinho(id_user) VALUES (?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$userId]);
    $json = json_encode($results);
    echo json_encode(["message"=>"Inserido com sucesso!"]);
  } catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }