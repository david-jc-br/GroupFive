<?php
include("./config.php");
$con = mysqli_connect($host, $login, $senha, $bd);
$sql = "DELETE FROM Pessoa WHERE idPessoa=".$_GET["idPessoa"];
mysqli_query($con, $sql);
header("location: ./index.php");
?>