<?php
session_start();

# Check if user is logged in
if (!isset($_SESSION['loggedin']) || !$_SESSION['loggedin'] == true) {
    header('Location: ../../frontend/www/index.php');
    exit;
}
?>