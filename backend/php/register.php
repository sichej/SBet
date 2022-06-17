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
    $sql = "SELECT * FROM user WHERE username = '$username'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "User already exists";
    } else {
        # Hash password
        $hash = md5($password);

        # Insert user into database
        $sql = "INSERT INTO user (username, password) VALUES ('$username', '$hash')";

        if ($conn->query($sql) === TRUE) {
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