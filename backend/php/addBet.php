<?php
include('../../backend/php/config.php');
session_start();

if(!isset($_SESSION['betted_games'])){
    $_SESSION['betted_games'] = array();
}

if(!isset($_SESSION['total_quote'])){
    $_SESSION['total_quote'] = 1;
}

if (isset($_POST['id_game']) && isset($_POST['result'])) {
    $id_game = $_POST['id_game'];
    $m_result = $_POST['result'];

    #check if game actually exist
    $sql = "SELECT * FROM game WHERE id_game = '$id_game'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        # if match exists and it's not already betted
        if(!in_array($id_game, $_SESSION['betted_games'])){
            array_push($_SESSION['betted_games'], $id_game);
            array_push($_SESSION['betted_games'], $m_result);

            $sql = "SELECT * FROM quote WHERE id_game = '$id_game'";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $_SESSION['total_quote'] *= $row[$m_result];
     
            header('Location: ../../frontend/www/'.$_SESSION['current_page']);
        }
        header('Location: ../../frontend/www/'.$_SESSION['current_page']);
    }else{
        # if doesn't exist
        header('Location: ../../frontend/www/'.$_SESSION['current_page']);
    }

}else{
    header('Location: ../../frontend/www/'.$_SESSION['current_page']);
}

?>