<?php
header("Content-Type: text/html; charset=UTF-8",true);
?>
<html>
<head><title>Incluir/Editar uma pessoa.</title></head>
<body>
<body style ="background-color:silver;">
<form name="form1" method="POST" action="incluir.php">
<?php
if(isset($_GET["idPessoa"])){
  include("./config.php");
  $con = mysqli_connect($host, $login, $senha, $bd);
?>
  <center><h3>Editar pessoa</h3></center>
<?php
  $sql = "SELECT Pessoa.*
          FROM Pessoa
          WHERE idPessoa=".$_GET['idPessoa'];
  $result = mysqli_query($con, $sql);
  $vetor = mysqli_fetch_array($result, MYSQLI_ASSOC);
  mysqli_close($con);
?>
  <input type="hidden" name="idPessoa" value="<?php echo $_GET['idPessoa']; ?>">
<?php
}else{
?>
  <center><h3>Cadastrar nova pessoa</h3></center>
<?php
}
?>
<table border="0" align="center" width="35%">
<tr><td width="20%">CPF:</td>
    <td colspan="2" width="90%">
    <input type="text" name="cpf" value="<?php echo @$vetor['cpf']; ?>" maxlength="11" size="11">
  </td>
</tr>
<tr><td width="20%">Nome:</td>
    <td colspan="2" width="90%">
	  <input type="text" name="primeiroNome" value="<?php echo @$vetor['primeiroNome']; ?>" maxlength="30" size="30">
</td>
<tr><td width="20%">Sobrenome:</td>
    <td colspan="2" width="90%">
	  <input type="text" name="sobrenome" value="<?php echo @$vetor['sobrenome']; ?>" maxlength="70" size="30">
</td>
</tr>
<tr><td width="20%">Cidade:</td>
    <td><input type="text" name="cidade" value="<?php echo @$vetor['cidade']; ?>" maxlength="30" size="30">
    </td>
</tr>
<tr><td width="20%">Estado:</td>
    <td colspan="2" width="90%">
    <input type="text" name="estado" value="<?php echo @$vetor['estado']; ?>" maxlength="2" size="30">
  </td>
</tr>
<tr><td width="20%">CEP:</td>
    <td colspan="2" width="90%">
    <input type="text" name="cep" value="<?php echo @$vetor['cep']; ?>" maxlength="8" size="8">
  </td>
</tr>
<tr><td width="20%">Bairro:</td>
    <td colspan="2" width="90%">
    <input type="text" name="bairro" value="<?php echo @$vetor['bairro']; ?>" maxlength="50" size="30">
  </td>
</tr>
<tr><td width="20%">Rua:</td>
    <td colspan="2" width="90%">
    <input type="text" name="rua" value="<?php echo @$vetor['rua']; ?>" maxlength="50" size="30">
  </td>
<tr><td width="20%">Numero:</td>
  <td colspan="2" width="90%">
  <input type="text" name="numero" value="<?php echo @$vetor['numero']; ?>" maxlength="5" size="5">
  </td>
<tr><td width="20%">Complemento:</td>
  <td colspan="2" width="90%">
  <input type="text" name="complemento" value="<?php echo @$vetor['complemento']; ?>" maxlength="30" size="30">
  </td>
</tr>
<tr><td colspan="3" align="center">
      <input type="submit" value="Salvar">
      <input type="button" value="Cancelar" onclick="location.href='index.php'">
    </td>
</tr>
</table>
</form>
</body>
</html>
