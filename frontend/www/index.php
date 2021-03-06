<!DOCTYPE html>
<?php 
    include('../../backend/php/config.php');
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
                <li><a class="active" href="./index.php">Home</a></li>
                <li><a href="./calcio.php">Calcio</a></li>
                <li><a href="./basket.php">Basket</a></li>
                <li><a href="./baseball.php">Baseball</a></li>
                <li><a href="./volleyball.php">volleyball</a></li>
                <li><a href="./mybet.php">My Bets</a></li>
            </ul>
            </div>
            <div class="centered">
                <a href="../../backend/php/logout.php">Log Out Btn</a>
                <?php
                    $username = $_SESSION['username'];
                    $sql = "SELECT * FROM user WHERE username = '$username'";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<br><a>money: ".$row['money']."</a>";
                        }
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
            for ($i = 0; $i <= count($_SESSION['betted_games']); $i = $i+2) {
                $id_game = $_SESSION['betted_games'][$i];
                $quote = $_SESSION['betted_games'][$i+1];
                $sql = "SELECT * FROM game WHERE id_game = '$id_game'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        # check if game's quote exists
                        $id_game = $row['id_game'];
                        $sql = "SELECT * FROM quote WHERE id_game = '$id_game'";
                        $resultQuote = $conn->query($sql);
                        $quotes = $resultQuote->fetch_assoc();
                        $str = "
                        <div class='match'>
                            <a class='games-names'>".$row['team1']."</a> vs <a class='games-names'>".$row['team2']."</a><br>
                            <a>betted: ". $quote . " quote: " .$quotes[$quote]."</a>
                        </div>";
                        # show on the screen all the matches (games)
                        echo $str;
                    }
                }
            }
            ?>
        </div>
        <div class="bet-footer">
            <a>quote: </a> 
            <a id="total-quote"><?php echo round($_SESSION['total_quote'],2) ?></a><br>
            <!-- betting -->
            <form action="../../backend/php/bet.php" method="POST">
                <a>amout: </a> 
                <input type="number" name="total_amount" class="total-amount">
                <input type="submit" value="Bet">
            </form>
            <!-- -->
        </div>
    </div>

    </body>
</html>