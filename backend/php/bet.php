<?php
include('../../backend/php/config.php');
session_start();

# generate random string for id_bet
function generateRandomString($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

if (isset($_POST['total_amount'])) {
    $total_amount = $_POST['total_amount'];
    $username = $_SESSION['username'];
    $money = 0;
    
    #check amount betted is regular
    if ($total_amount < 2) exit;
    if ($total_amount > 9999) exit;

    $id_bet = generateRandomString(16);
    $total_quote = round($_SESSION['total_quote'],2);

    # check if user's money are enought for the bet
    $sql = "SELECT money FROM user WHERE username = '$username'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $money = $row['money'];
            if ($money < $total_amount){
                # not enough money
                header('Location: ../../frontend/www/index.php');
                exit;
            }
        }
    }

    # insert bet into db
    $sql = "INSERT INTO bet (id_bet, total_quote, amount_betted) VALUES ('$id_bet', '$total_quote', '$total_amount')";
    if ($conn->query($sql) === TRUE) {
        echo "Betted";
        # insert link bet to user
        $sql = "INSERT INTO bet_user (id_bet, username) VALUES ('$id_bet', '$username')";
        if ($conn->query($sql) === TRUE){

            # link id_bet to id_game id_single_game
            for ($k = 0; $k < count($_SESSION['betted_games']); $k += 2){
                $id_betted = $_SESSION['betted_games'][$k];
                $betted_result = $_SESSION['betted_games'][$k+1];
                if($betted_result == "one") $betted_result = 1;
                if($betted_result == "two") $betted_result = 2;
                $id_single_bet = generateRandomString(16);
                $sql = "INSERT INTO bet_game (id_single_bet, id_bet) VALUES ('$id_single_bet', '$id_bet')";
                $conn->query($sql);
                $sql = "INSERT INTO bet_single_game (id_game, betted_result ,id_single_bet) VALUES ('$id_betted', '$betted_result', '$id_single_bet')";
                $conn->query($sql);
            }

            # update money on user profile
            $updated_money = $money - $total_amount;
            $sql = "UPDATE user SET money = ' $updated_money' WHERE username = '$username'";
            if ($conn->query($sql) === TRUE){
                $_SESSION['total_quote'] = 1;
                $_SESSION['betted_games'] = array();
                header('Location: ../../frontend/www/index.php');
            }
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
}
?>