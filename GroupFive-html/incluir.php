<?php
  include("./config.php");
  $con = mysqli_connect($host, $login, $senha, $bd);
  if(isset($_POST["idPessoa"])){
    $sql = "SELECT idPessoa FROM Pessoa WHERE idPessoa=".$_POST["idPessoa"];
    $result = mysqli_query($con, $sql);
    if(mysqli_num_rows($result)!=0){
      $sql = "UPDATE Pessoa
              SET cpf         ='".$_POST["cpf"]."',
                  primeiroNome='".$_POST["primeiroNome"]."',
                  sobrenome='"   .$_POST["sobrenome"]."',
                  cidade='"       .$_POST["cidade"]."',
                  estado='"       .$_POST["estado"]."',
                  cep='"          .$_POST["cep"]."',
                  bairro='"       .$_POST["bairro"]."',
                  rua='"          .$_POST["rua"]."',
                  numero="       .$_POST["numero"].",
                  complemento='"  .$_POST["complemento"]."'
                  WHERE idPessoa=".$_POST["idPessoa"];
    }
  }
  else{
    $sql = "INSERT INTO Pessoa VALUES (NULL,
                                            '".$_POST["cpf"]."',
                                            '".$_POST["primeiroNome"]."',
                                            '".$_POST["sobrenome"]."',
                                            '".$_POST["cidade"]."',
                                            '".$_POST["estado"]."',
                                            '".$_POST["cep"]."',
                                            '".$_POST["bairro"]."',
                                            '".$_POST["rua"]."',
                                            ".$_POST["numero"].",
                                            '".$_POST["complemento"]."')";
  }
  mysqli_query($con, $sql);
  mysqli_close($con);
  header("location: ./index.php");
?>
