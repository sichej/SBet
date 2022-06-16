<?php
include('config.php');
session_start();

if(isset($_POST['submit']) && (trim($_POST['submit']) == "Login"))
{ 
  // controllo sui parametri di autenticazione inviati
  if( !isset($_POST['username']) || $_POST['username']=="" )
  {
    echo "Attenzione, inserire l'username.";
  }
  elseif( !isset($_POST['password']) || $_POST['password'] =="")
  {
    echo "Attenzione, inserire la password.";
  }else{
    // validazione dei parametri tramite filtro per le stringhe
    $username = trim(filter_var($_POST['username'], FILTER_SANITIZE_STRING));
    $password = trim(filter_var($_POST['password'], FILTER_SANITIZE_STRING));
    $password = md5($password);

    if ($result = $conn -> query("SELECT * FROM user WHERE username = '$username' AND password = '$password'")) {
        echo "Returned rows are: " . $result -> num_rows;
        // Free result set
        $result -> free_result();
        echo $result;
      }
  }
}

?>