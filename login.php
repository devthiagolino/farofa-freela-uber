<?php
	include('connection.php');
	include('common.php');
	include('user.php');
	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();
	
	if(isset($_GET['logout']) && User::isAnyLogged($conn)) {
		User::logout($conn);
		header('location: login.php');
		die();
	}
	
	User::ifUserLoggedRedirect('game.php',$conn);
	
	$errors = array(1 => "Email inválido!", 2 => "Email inexistente!");
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php include("header.php"); ?>
		<div id="content" class="centralizer">
			<div class="col-left">
				<img src="img/login-title.png" id="login"/>
				<form action="login2.php" method="POST">
					<label for="parent-email">Já é cadastrado? Faça seu login e boa diversão!</label>
					<div class="error">
						<?= (isset($_GET['err']) ? $errors[$_GET['err']] : ""); ?>
					</div>
					<input name="parent-email" type="email" placeholder="E-mail do pai ou responsável" required/>
					<input type="image" src="img/parent-login-btn.png" alt="Entrar!"/>
				</form>
			</div>
			<div class="col-right" style="border-bottom: 1px solid #696969;">
				<div>
					<a href="new-account.php"><img src="img/new-account-title.png" id="new-account"/></a>
				</div>
			</div>
			<hr/>
			<div class="col-right">
				<div>
					<a href="visitor.php"><img src="img/visitor-title.png" id="visitor"/></a>
				</div>
			</div>
		</div>
		<?php include('footer.php'); ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
	</body>
</html>