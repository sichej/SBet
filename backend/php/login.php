<?php
include('config.php');
session_start();

# Check if user is logged in
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    header('Location: ../../frontend/www/index.php');
    exit;
}

# Check if user is trying to log in
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password = md5($password);

    # Check if user exists
    $sql = "SELECT * FROM user WHERE username = '$username'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $hash = $row['password'];

        if ($password == $hash) {
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header('Location: ../../frontend/www/index.php');
            exit;
        } else {
            echo "Incorrect password";
        }
    } else {
        echo "User not found";
    }
}


?>