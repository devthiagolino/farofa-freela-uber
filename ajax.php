<?php

	include('connection.php');
	include('user.php');
	include('stats.php');
	include('common.php');
	
	if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['type'])) {
    
		$type = $_POST['type'];
		
		if($type == 'changePlayerPassword') {
			if(!User::isParentLogged($conn)) {
				die('{"success":false,"reason":"Login inválido"}');
			}
			
			if(!isset($_POST['password']) || !isset($_POST['password-confirmation']) || !isset($_POST['hash']) || !isset($_POST['isChild']) || $_POST['isChild'] == '0') {
				die('{"success":false,"reason":"Erro na validação dos dados.","errCode":1}');
			}
			$password = $_POST['password'];
			$passwordConfirmation = $_POST['password-confirmation'];
			
			if(strlen($password) < 6) {
				die('{"success":false,"reason":"A senha precisa ter no mínimo 6 caracteres.","errCode":2}');
			}
			
			if($password != $passwordConfirmation) {
				die('{"success":false,"reason":"As senhas precisam ser iguais.","errCode":3}');
			}
			
			$query = $conn->prepare("SELECT login FROM player WHERE parent_id = ".User::getUser()->getId()." && user_hash = ?");
			$query->bind_param('s',$_POST['hash']);
			if($query->execute()) {
				
				$res = $query->get_result();
				
				if($res->num_rows == 0) {
					die('{"success":false,"reason":"Não foi possível autenticar o request.","errCode":4}');
				}
				
				$user = $res->fetch_assoc();
				
				$salt = "".bin2hex(mcrypt_create_iv(32));
				$password_hash = hash('sha256', $password.$salt);
				$user_hash = hash('sha256', $user['login'].$password.$salt);
				
				$conn->query("UPDATE player SET password = '$password_hash', salt = '$salt', user_hash = '$user_hash' WHERE user_hash = '".$_POST['hash']."'");
				
				die('{"success":true,"hash":"'.$user_hash.'"}');
			}
		}
		else if($type == 'deleteCharacter') {
			if(!User::isParentLogged($conn)) {
				die('{"success":false,"reason":"Login inválido"}');
			}
			
			if(!isset($_POST['hash'])) {
				die('{"success":false,"reason":"Erro na validação dos dados."}');
			}
			
			$hash = $_POST['hash'];
			
			$query = $conn->prepare("SELECT login FROM player WHERE parent_id = ".User::getUser()->getId()." && user_hash = ?");
			$query->bind_param('s',$_POST['hash']);
			if($query->execute()) {
				
				$res = $query->get_result();
				
				if($res->num_rows == 0) {
					die('{"success":false,"reason":"Não foi possível autenticar o request."}');
				}
			}
			
			$id = -1;
			$res = $conn->query('SELECT id FROM parent WHERE email = "deleted"');
			if($res->num_rows == 0) {
				$res = $conn->prepare('INSERT INTO parent VALUES (0,"deleted","","","'.bin2hex(mcrypt_create_iv(32)).'")');
				if($res->execute()) {
					$id = $conn->insert_id;
				}
				else {
					die('{"success":false,"reason":"Não foi possível completar essa ação, tente novamente."}');
				}
			}
			else {
				$id = $res->fetch_assoc()['id'];
			}
			
			$conn->query("UPDATE player SET deleted = 1, parent_id = $id WHERE user_hash = '".$_POST["hash"]."'");
			
			die('{"success":true,"id":'.$id.'}');
			
		}
		else if($type == "characterStats") {
			if(!User::isParentLogged($conn)) {
				die('{"success":false,"reason":"Login inválido"}');
			}
			
			if(!isset($_POST['hash'])) {
				die('{"success":false,"reason":"Erro na validação dos dados."}');
			}
			
			$query = $conn->prepare('SELECT id FROM player WHERE user_hash = ?');
			$query->bind_param('s',$_POST['hash']);
			$id = -1;
			if($query->execute()) {
					
				$res = $query->get_result();
				if($res->num_rows == 0) {
					die('{"success":false,"reason":"Não foi possível autenticar o request."}');
				}
				$id = $res->fetch_assoc()['id'];
			}
			
			$stats = calculate_player_stats($id, $conn);
			die(json_encode($stats));
			
		}
		else if($type == "rememberParentPassword") {
			if(!isset($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
				die('{"success":false,"reason":"Email inválido."}');
			}
			
			$query = $conn->prepare('SELECT user_hash FROM parent WHERE email = ?');
			$query->bind_param('s',$_POST['email']);
			
			if($query->execute()) {
				$res = $query->get_result();
				if($res->num_rows == 0) {
					die('{"success":false,"reason":"Email inválido."}');
				}
				if(resendParentPasswordLink($_POST['email'],$res->fetch_assoc()['user_hash'])) {
					die('{"success":true}');
				}
				else {
					die('{"success":false,"reason":"Ocorreu um erro no envio do email. Por favor tente novamente."}');
				}
			}
			
			die('{"success":false,"reason":"Ocorreu um erro no envio do email. Por favor tente novamente."}');
		}
		else if($type == "rememberChildPassword") {
			if(!isset($_POST['childId']) || !isset($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
				die('{"success":false,"reason":"Erro na validação dos dados."}');
			}
			
			$query = $conn->prepare('SELECT p.*, pp.* FROM player as p, parent as pp WHERE pp.email = ? AND p.parent_id = pp.id AND p.id = ?');
			$query->bind_param('ss',$_POST['email'],$_POST['childId']);
			
			if($query->execute()) {
				$res = $query->get_result();
				if($res->num_rows == 0) {
					die('{"success":false,"reason":"Não foi possível encontrar um jogador com esse id."}');
				}
				resendChildPasswordLink($_POST['email'],$res->fetch_assoc()['login']);
				die('{"success":true}');
			}
			else {
				//$conn->error
				die('{"success":false,"reason":"'+ "Ops! Algo deu errado. Por favor tente novamente." +'"}');
			}
		}
		else if($type == "validateParentEmail") {
			//TODO: terminar
		}
	}

?>