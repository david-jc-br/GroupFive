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

		function cadastrarPessoa($id, $cpf, $nome, $sobrenome, $cidade, $estado, $cep, $bairro, $rua, $numero, $complemento = null) {
			$sql = $this->conexao->prepare("INSERT INTO Pessoa VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			$sql->bind_param("issssssssis", $id, $cpf, $nome, $sobrenome, $cidade, $estado, $cep, $bairro, $rua, $numero, $complemento);

			if ($sql->execute() === TRUE) {
				echo "Pessoa cadastrada!\n";
			} else {
				echo "Erro ao cadastrar pessoa!\n";
			}
		}

		function excluirPessoa($id) {
			$sql = $this->conexao->prepare("DELETE FROM Pessoa WHERE idPessoa = ?");
			$sql->bind_param("i", $id);

			if ($sql->execute() === TRUE) {
				echo "Pessoa excluída!\n";
			} else {
				echo "Erro ao excluir pessoa!\n";
			}
		}

		function cadastrarCliente($id, $email) {
			$sql = $this->conexao->prepare("INSERT INTO Cliente (idCliente, email) VALUES (?, ?)");
			$sql->bind_param("is", $id, $email);

			if ($sql->execute() === TRUE) {
				echo "Cliente cadastrado!\n";
			} else {
				echo "Erro ao cadastrar cliente!\n";
			}
		}

		function excluirCliente($id) {
			$sql = $this->conexao->prepare("DELETE FROM Cliente WHERE idCliente = ?");
			$sql->bind_param("i", $id);

			if ($sql->execute() === TRUE) {
				echo "Cliente excluído!\n";
			} else {
				echo "Erro ao excluir cliente!\n";
			}
		}


		function verificarConexao(){
			if (!$this->conexao) {
				die("Falha na conexão: " . mysqli_connect_error()) . "\n\n";
			}

			echo "Conectado!\n";
		}

		function tabelaClientes() {
			$sql = "SELECT (P.idPessoa, P.primeiroNome, P.sobrenome, P.cpf, C.email, C.pedidosEfetuados, C.totalGasto) FROM Pessoa P NATURAL JOIN Cliente C ORDER BY idPessoa";
			return mysqli_query($this->conexao, $sql);
		}
	}


	#$GroupFive->verificarConexao();

	#$GroupFive->cadastrarPessoa(1111, "12345678900", "Victor", "Gon", "CB", "MG", "37270000", "Bairro", "Rua", 25, "ok");

	#$GroupFive->cadastrarCliente(1111, "victor@email.com");

	#$GroupFive->excluirPessoa(1111);

	# $GroupFive->excluirCliente(1111);

?>