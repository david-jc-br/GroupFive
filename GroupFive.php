<?php

class LogisticaVendas {

	public $servername;
	public $username;
	public $password;
	public $database;

	public $conexao;

	function __construct($s, $u, $p, $d) {
		$this->servername = $s;
		$this->username = $u;
		$this->password = $p;
		$this->database = $d;

		$this->conexao = new mysqli($this->servername, $this->username, $this->password, $this->database);
	}

	function __destruct() {
		$this->conexao->close();
	}

	function verificarConexao(){
		if (!$this->conexao) {
			die("Falha na conexão: " . mysqli_connect_error()) . "\n\n";
		}

		echo "Conectado!";
	}

	function cadastrarFuncionario($idFunc, $nomeFunc, $endereco, $dataNasc, $sexo, $salario, $idSuperv, $idDepto) {
		$sql = "INSERT INTO Funcionario
				VALUES ($idFunc, '$nomeFunc', '$endereco', '$dataNasc', '$sexo', $salario, $idSuperv, $idDepto);";

		if ($this->conexao->query($sql) === TRUE) {
			echo "Funcionario cadastrado!";
		} else {
			echo "Error: " . $sql . "\n" . $this->conexao->error . "\n\n";
		}
	}

	function excluirFuncionario($idFunc) {
		$sql = "DELETE FROM Funcionario
				WHERE idFunc = $idFunc;";

		if ($this->conexao->query($sql) === TRUE) {
			echo "Funcionario excluido!";
		} else {
			echo "Error: " . $sql . "\n" . $this->conexao->error;
		}
	}
}


function main() {

	$GroupFive = new LogisticaVendas("localhost", "root", null, "Empresa");

	$escolha = 0;

	switch ($escolha) {
		case 0:
			$GroupFive->verificarConexao();
			break;
		case 1:
			$GroupFive->cadastrarFuncionario(9, "Victor", 'R. Joao Matioli, 775', '2001/07/02', 'M', 500, 2, 1);
			break;
		case 2:
			$GroupFive->excluirFuncionario(9);
			break;
		default:
			break;
	}

}


main();


?>

