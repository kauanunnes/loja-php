<?php
$servername = "localhost:3306";
$username = "root";
$dbPassword = "";

try {
  $conn = new PDO("mysql:host=$servername;dbname=loja", $username, $dbPassword);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}