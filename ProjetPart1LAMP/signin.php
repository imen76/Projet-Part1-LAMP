<?php

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'demo');
$db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // username and password sent from form

    $nom_utilisateur = mysqli_real_escape_string($db,$_POST['nom_utilisateur']);
    $password = mysqli_real_escape_string($db,$_POST['password']);

    $sql = "SELECT 'utilisateur_idutilisateur' FROM `utilisateur` WHERE `utilisateur_nom_utilisateur` = '$nom_utilisateur' AND `utilisateur_password` = '$password'";
    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    // $active = $row['active'];

    $count = mysqli_num_rows($result);

    // If result matched $myusername and $mypassword, table row must be 1 row
    if($count == 1) {
        $_SESSION['login_user'] = $nom_utilisateur;

        // Set cookie to last 1 year
        setcookie('nom_utilisateur', $_POST['nom_utilisateur'], time()+60*60*24*365);
        setcookie('password', md5($_POST['password']), time()+60*60*24*365);

        header("location: accueil.php");
    } else {
        header("location: accueil.php");
    }
}
