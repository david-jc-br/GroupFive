<?php
header("Content-Type: text/html; charset=UTF-8",true);
?>
<html>
<head><title>Logística de Vendas</title></head>
<body>
<body style ="background-color:silver;">
<center><h3>Pessoas</h3></center>
<form name="form1" method="POST" action="form_incluir.php">
<table align="center" width="90%">
<?php
include("./config.php");
$con = mysqli_connect($host, $login, $senha, $bd);
$sql = "SELECT Pessoa.*
        FROM Pessoa
        ORDER BY primeiroNome";
$tabela = mysqli_query($con, $sql);
if(mysqli_num_rows($tabela)==0){
?>
  <tr><td align="center">Nenhuma pessoa cadastrada.</td></tr>
  <tr><td align="center"><input type="submit" value="Incluir pessoa"></td></tr>
<?php
}else{
?>
	<tr border="1" frame="hsides" rules="rows" bgcolor="grey">
                     <td width="9%" align="center"><b>CPF</b></td>
                     <td width="9%" align="center"><b>Nome</b></td>
                     <td width="9%" align="center"><b>Cidade</b></td>
                     <td width="9%" align="center"><b>Estado</b></td>
                     <td width="9%" align="center"><b>CEP</b></td>
                     <td width="9%" align="center"><b>Bairro</b></td>
                     <td width="9%" align="center"><b>Rua</b></td>
                     <td width="9%" align="center"><b>Numero</b></td>
                     <td width="9%" align="center"><b>Complemento</b></td>
                     <td width="10%"align="center"><b>Opções</b></td>
    </tr>
<?php
  while($dados = mysqli_fetch_row($tabela)){
?>
  <tr bgcolor="#d3d3d3" align="center">
      <td><?php echo $dados[1]; ?></td>
      <td><?php echo $dados[2]." ".$dados[3]; ?></td>
      <td><?php echo $dados[4]; ?></td>
      <td><?php echo $dados[5]; ?></td>
      <td><?php echo $dados[6]; ?></td>
      <td><?php echo $dados[7]; ?></td>
      <td><?php echo $dados[8]; ?></td>
      <td><?php echo $dados[9]; ?></td>
      <td><?php echo $dados[10]; ?></td>

	  <td align="center">
	    <input type="button" value="Editar" onclick="location.href='form_incluir.php?idPessoa=<?php echo $dados[0]; ?>'">
      <input type="button" value="Excluir" onclick="location.href='excluir.php?idPessoa=<?php echo $dados[0]; ?>'">
	  </td>
  </tr>
<?php
  }
?>
<tr bgcolor="grey"><td colspan="12" height="5"></td></tr>
<?php
mysqli_close($con);
?>
<tr><td colspan="12" align="center"><input type="submit" value="Adicionar nova pessoa"></td></tr>
<?php
}
?>
</table>
</form>
</body>
</html>
