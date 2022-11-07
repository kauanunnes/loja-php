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
    echo json_encode(["message"=>"Inserido com sucesso!"]);
  } catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }