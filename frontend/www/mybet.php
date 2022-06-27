<!DOCTYPE html>
<?php 
    session_start();
    # Check if user is logged in
    if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] != true) {
        header('Location: ./login.html');
        exit;
    }
?>
<html>
    <head>
        <title>Calcio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/script.js"></script>
        <link rel="stylesheet" href="./css/calcio.css">
        <link rel="stylesheet" href="./css/navbar.css">
        <link rel="stylesheet" href="./css/btn.css">
    </head>
    <body>
        <div class="split left">
            <div>
            <ul>
                <li><a href="./index.php">Home</a></li>
                <li><a href="./calcio.php">Calcio</a></li>
                <li><a href="./basket.php">Basket</a></li>
                <li><a href="./baseball.php">Baseball</a></li>
                <li><a href="./volleyball.php">volleyball</a></li>
                <li><a class="active" href="./mybet.php">My Bets</a></li>
            </ul>
            </div>
            <div class="centered">
            <?php 
                include('../../backend/php/config.php');
                session_start();
                $username = $_SESSION['username'];
                #$sql = "SELECT * FROM bet_user WHERE username = '$username'";
                $sql = "SELECT bet.id_bet, bet.total_quote FROM bet JOIN bet_user ON bet.id_bet = bet_user.id_bet WHERE bet_user.username = '$username'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        $str = "
                        <div class='match'>
                            <form method='POST' action='../../backend/php/viewBet.php'>
                                <a> ".$row['id_bet']." </a><br>
                                <input name='id_bet' value=".$row['id_bet']." type='hidden'>
                                <a> Quote: ".$row['total_quote']." </a>
                                <input type='submit' name='submit' value='view bet'>
                            </form>
                        </div>";
                        # show on the screen all the matches (games)
                        echo $str;
                    }
                } else {
                    echo "0 results";
                }
            ?>
            </div>
    </div>

    <div class="split right">
        <div class="bet-title">
            <h2>Bet</h2>
        </div>
        <div class="centered">
            <?php
            for ($i = 0; $i <= count($_SESSION['view_bet']); $i = $i+2) {
                $id_game = $_SESSION['view_bet'][$i];
                $betted_result = $_SESSION['view_bet'][$i+1];
                $sql = "SELECT team1, team2 FROM game WHERE id_game = '$id_game'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        $str = "
                        <div class='match'>
                            <a class='games-names'>".$row['team1']."</a> vs <a class='games-names'>".$row['team2']."</a><br>
                            <a>betted: ". $betted_result . "</a>
                        </div>";
                        # show on the screen all the bets (games)
                        echo $str;
                    }
                }
            }
            ?>
        </div>
        <div class="bet-footer">
        </div>
    </div>

    </body>
</html>