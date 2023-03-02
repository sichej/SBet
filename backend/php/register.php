<?php
include('config.php');
session_start();

# Check if user is logged in
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    header('Location: ../../frontend/www/index.php');
    exit;
}

# Check if user is trying to register
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    # Check if user exists
    $result = $conn->execute_query("SELECT * FROM user WHERE username = ?", [$username]);

    if ($result->num_rows > 0) {
        echo "User already exists";
    } else {
        # Hash password
        $hash = md5($password);

        # Insert user into database
        if ($conn->execute_query("INSERT INTO user (username, password, money) VALUES (?,?,?)", [$username], [$hash], 100) === TRUE) {
            echo "User created successfully";
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header('Location: ../../frontend/www/index.php');
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}



?>