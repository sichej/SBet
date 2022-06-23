<?php
include('../../backend/php/config.php');
session_start();

if(!isset($_SESSION['betted_games'])){
    $_SESSION['betted_games'] = array();
}

if (isset($_POST['id_game']) && isset($_POST['result'])) {
    $id_game = $_POST['id_game'];
    $m_result = $_POST['result'];

    #check if game actually exist
    $sql = "SELECT * FROM game WHERE id_game = '$id_game'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        # if match exists
        #array_push($_SESSION['betted_games'], $id_game);
        array_push($_SESSION['betted_games'], $id_game);
        array_push($_SESSION['betted_games'], $m_result);
        header('Location: ../../frontend/www/calcio.php');
    }else{
        # if doesn't exist
        header('Location: ../../frontend/www/basket.php');
    }

}else{
    header('Location: ../../frontend/www/volleyball.php');
}

?>