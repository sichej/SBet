<?php
include('../../backend/php/config.php');
session_start();

if (isset($_POST['id_game']) && isset($_POST['result'])) {
    $id_game = $_POST['id_game'];
    $result = $_POST['result'];

    #check if game actually exist
    $sql = "SELECT * FROM game WHERE id_game = '$id_game'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        # if match exists
        $game[] = array($id_game, $result);
        array_push($_SESSION['betted_games'], $game);
        header('Location: ../../frontend/www/index.php');
    }else{
        # id doesn't exist
        header('Location: ../../frontend/www/basket.php');
    }

}else{
    header('Location: ../../frontend/www/volleyball.php');
}

?>