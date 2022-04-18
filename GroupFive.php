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

		include "GroupFive.sql";
		$sql = ob_get_clean();
		if ($this->conexao->query($sql) === TRUE) {
			echo "Funcionario cadastrado!";
		} else {
			echo "Error: " . $sql . "\n" . $this->conexao->error . "\n\n";
		}
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

}


function main() {

	$GroupFive = new LogisticaVendas("localhost", "root", "2506", "Empresa");

	$GroupFive->verificarConexao();

}


main();


?>

