<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	
	$error = "";
	
	if($_SERVER['REQUEST_METHOD'] == 'POST') {
		$hash = "";
		$screenName = "";
		if(User::isParentLogged($conn)) {
			$hash = User::getUser()->getUserHash();
			$screenName = User::getUser()->getScreenName();
		}
		else if(isset($_POST['hash']) && $_POST['hash'] != "") {
			$hash = $conn->real_escape_string($_POST['hash']);
			$res = $conn->query('SELECT email FROM parent WHERE user_hash = "'.$hash.'"');
			
			$screenName = $res->fetch_assoc()["email"];
		}
		if(!isset($_POST['password']) || !isset($_POST['password-confirmation']) || $hash == "") {
			$error = 'Ocorreu um erro com a validação dos dados. Por favor tente novamente.';
			goto err;
		}
		
		$password = $_POST['password'];
		$passwordConfirmation = $_POST['password-confirmation'];
		
		if(strlen($password) < 6) {
			$error = "A senha precisa ter no mínimo 6 caracteres.";
			goto err;
		}
		
		if($password != $passwordConfirmation) {
			$error = "As senhas precisam ser iguais.";
			goto err;
		}
		
		$salt = "".bin2hex(mcrypt_create_iv(32));
		$password_hash = hash('sha256', $password.$salt);
		$user_hash = hash('sha256', $screenName.$password.$salt);
		
		$conn->query("UPDATE parent SET password = '$password_hash', salt = '$salt', user_hash = '$user_hash' WHERE user_hash = '$hash'");
		
		if(User::isParentLogged($conn))
			User::getUser()->setUserHash($user_hash);
		
		echo $password;
		
		header('location: parents.php');
		die();
	}
	else if($_SERVER['REQUEST_METHOD'] == 'GET') {
		if(isset($_GET['hash'])) {
			echo $conn->real_escape_string($_POST['hash']);
		}
		else if(!User::isParentLogged($conn)) {
			header('location: index.php');
			die();
		}
	}
	err:
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<link rel="stylesheet" href="css/fonts.css"/>
		<link rel="stylesheet" href="css/common.css"/>
		<link rel="stylesheet" href="css/jumbotron.css"/>
		<link rel="stylesheet" href="css/parents_password_change.css"/>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php
		$parentsClass = "current";
		$aboutClass = $helpClass = $rankingClass = ""; 
		include('header.php') 
		?>
		
		<div id="content" class="centralizer">
			<img src="img/parents-main.png"/>
			<form method="POST" action="parent-password-change.php">
				<h2>Olá! Cadastre uma nova senha para acessar o Cantinho dos Pais.</h2>
				<span class="error"><?= $error ?></span>
				<input type="hidden" name="hash" value="<?= isset($_GET['hash']) ? $_GET['hash'] : (isset($hash) ? $hash : '') ?>"/>
				<label for="password">Senha</label>
				<input type="password" name="password" id="password"/>
				<label for="password-confirmation">Confirmar senha</label>
				<input type="password" name="password-confirmation" id="password-confirmation"/>
				<input type="image" src="img/save-btn.png" alt="Salvar"/>
			</form>
		</div>
		
		<?php include('footer.php') ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
	</body>
</html>



