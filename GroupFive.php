<?php

class LogisticaVendas {
	public $servername;
	public $username;
	public $password;
	public $database;

	public $conexao;

	function __construct($s, $u, $p, $d) {
		$this->servername = $s; $this->username = $u; $this->password = $p; $this->database = $d;
		$this->conexao = new mysqli($this->servername, $this->username, $this->password, $this->database);
	}

	function __destruct() {
		$this->conexao->close();
	}

	function inserirPessoa($id, $nome, $sobrenome, $cidade, $estado, $cep, $bairro, $rua, $numero, $complemento = null) {
		$sql = "INSERT INTO Pessoa VALUES (" + $id + "," + $nome + "," + $sobrenome + "," + $cidade + "," + $estado + "," + $cep + "," + $bairro + "," + $rua + "," + $numero + "," + $complemento + ");";
		if ($this->conexao->query($sql) === TRUE) {
			echo "Pessoa cadastrada!";
		} else {
			echo "Error: " . $sql . "\n" . $this->conexao->error . "\n\n";
		}


	}

	function verificarConexao(){
		if (!$this->conexao) {
			die("Falha na conexão: " . mysqli_connect_error()) . "\n\n";
		}

		echo "Conectado!";
	}
}


function main() {

	$GroupFive = new LogisticaVendas("localhost", "root", "2506", "LogisticaVendas");

	$GroupFive->verificarConexao();

	$GroupFive->inserirPessoa(1111, "12345678900", "Victor", "Gon", "CB", "MG", "37270000", "Bairro", "Rua", 25, null);
}


main();


?>

