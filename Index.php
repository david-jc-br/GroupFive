<?php

	header("Content-Type: text/html; charset=iso-8859-1",true);

	include("LogisticaVendas.php");

?>


<html>

	<head>

		<title>Tabela de Clientes</title>

	</head>

	<body>

		<center><h3>Tabela de Clientes</h3></center>

		<form name="form1" method="POST" action="LogistiscaVendas.php">

			<table border="0" align="center" width="60%">

				<?php
				include("LogisticaVendas.php");
				$GroupFive = new LogisticaVendas("localhost", "root", "2506", "LogisticaVendas");
				$tabela = $GroupFive->tabelaClientes();
				if(mysqli_num_rows($tabela)==0){
				?>
				<tr><td align="center">Não há nenhum cliente cadastrado.</td></tr>
				<tr><td align="center"><input type="submit" value="incluir Contato"></td></tr>
				<?php
				}else{
				?>
					<tr bgcolor="grey">

						<td width="50%">Nome</td>
						<td width="50%">ID</td>
						<td width="50%">Nome</td>
						<td width="50%">Sobrenome</td>
						<td width="50%">CPF</td>
						<td width="50%">Email</td>
						<td width="50%">Pedidos Efeutados</td>
						<td width="50%">Total Gasto</td>

					</tr>
				<?php
				while($dados = mysqli_fetch_row($tabela)){
				?>
				<tr>

					<td><?php echo $dados[0]; ?></td>
					<td><?php echo $dados[1]; ?></td>
					<td><?php echo $dados[2]; ?></td>
					<td><?php echo $dados[3]; ?></td>
					<td><?php echo $dados[4]; ?></td>
					<td><?php echo $dados[5]; ?></td>
					<td><?php echo $dados[6]; ?></td>

				</tr>
				<?php
				}
				?>
				<tr bgcolor="grey"><td colspan="3" height="5"></td></tr>
				<?php

				?>
				<tr><td colspan="3" align="center"><input type="submit" value="Incluir Novo Contato"></td></tr>
				<?php
				}
				?>

			</table>

		</form>

	</body>

</html>


