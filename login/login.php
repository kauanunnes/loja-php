<?php
  include '../php/database.php';
  $email = $_POST["email"];
  $password = $_POST["password"];
  
  try {
    $sql = "SELECT id, email, senha FROM user WHERE email = ?";
    $myObj = new \stdClass();
    if($stmt = $conn->prepare($sql)){
      if($stmt->execute([$email])){
          if($stmt->rowCount() == 1){
              if($row = $stmt->fetch()){
                  $id = $row["id"];
                  $email = $row["email"];
                  $hashed_password = $row["senha"];
                  if($password == $hashed_password){
                      $myObj->id = $id;
                      $myObj->email = $email;
                      $myObj->loggedin = true;
                  } else{
                      $myObj->id = null;
                      $myObj->email = null;
                      $myObj->loggedin = false;
                      $login_err = "Invalid username or password.";
                  }
              }
          } else{
              $myObj->id = null;
              $myObj->email = null;
              $myObj->loggedin = false;
              $login_err = "Invalid username or password.";
          }
      } else{
          echo "Oops! Something went wrong. Please try again later.";
      }

      // Close statement
      unset($stmt);
    }
    $myJSON = json_encode($myObj);
    echo $myJSON;
  } catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }
        
  
