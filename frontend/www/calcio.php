<!DOCTYPE html>
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
    </head>
    <body>
        <div class="split left">
            <div>
            <ul>
                <li><a href="./index.php">Home</a></li>
                <li><a class="active" href="./calcio.php">Calcio</a></li>
                <li><a href="./basket.php">Basket</a></li>
                <li><a href="./baseball.php">Baseball</a></li>
                <li><a href="./volleyball.php">volleyball</a></li>
            </ul>
            </div>
            <div class="centered">
            <?php 
                include('../../backend/php/config.php');
                session_start();
                $resultset = array();
                $sql = "SELECT * FROM game WHERE sport = 'calcio'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        $str = "
                        <div class='match'>
                            <a>".$row['team1']."</a> vs <a>".$row['team2']."</a>
                            
                        
                        </div>";
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
            <h2>John Doe</h2>
            <p>Some text here too.</p>
        </div>
        <div class="bet-footer">
            <a>quote: </a> 
            <a id="total-quote">7</a><br>
            <a>amout: </a> 
            <a id="total-amount">7</a>
        </div>
    </div>

    </body>
</html>