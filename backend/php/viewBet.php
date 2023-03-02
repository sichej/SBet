<?php
include('../../backend/php/config.php');
session_start();

$_SESSION['view_bet'] = array();


if (isset($_POST['id_bet'])) {
    $id_bet = $_POST['id_bet'];

    #check if game actually exist
    $result = $conn->execute_query("SELECT bet_single_game.id_game, betted_result FROM bet_game JOIN bet_single_game ON bet_game.id_single_bet = bet_single_game.id_single_bet  WHERE bet_game.id_bet = ?", [$id_bet]);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($_SESSION['view_bet'], $row['id_game']);
            array_push($_SESSION['view_bet'], $row['betted_result']);
        }
        header('Location: ../../frontend/www/mybet.php');
    }else{
        # if doesn't exist
        header('Location: ../../frontend/www/index.php');
    }

}else{
    header('Location: ../../frontend/www/index.php');
}

?>