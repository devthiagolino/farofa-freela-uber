<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();
	
	User::ifUserLoggedRedirect('game.php',$conn);
	
	$error = "";
	
	if($_SERVER['REQUEST_METHOD'] === 'POST') {
		try {
			$result = newAccount($_POST,$conn);
			User::loginUser($result, FALSE, $conn);
			User::ifUserLoggedRedirect('game.php',$conn);
		}
		catch(Exception $ex) {
			$error = $ex->getMessage();
		}
	}
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<link rel="stylesheet" type="text/css" href="css/new-account.css"/>
		<link rel="stylesheet" type="text/css" href="css/popup.css"/>
		<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
		<?php endif; ?>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php include("popup.php") ?>
		<?php include("header.php") ?>
		<div id="content" class="centralizer">
			<form action="new-account.php" method="POST">
				<div>
					<img class="title" src="img/new-account.png"/>
					<h2>Bem-vindo ao URBZ!</h2>
					<label for="name">Nome completo: </label>
					<input type="text" id="name" name="name" maxlength="60" value="<?=isset($_POST['name']) ? $_POST['name'] : ""?>"/>
					<img class="slidesjs-next slidesjs-navigation" src="img/next-btn.png"/>
					<img class="speech min-3-characters" src="img/speech-min-3-characters.png"/>
				</div>
				<div class="gender-pick">
					<img class="title" src="img/new-account.png"/>
					<p>Você é:</p>
					<input id="gender0" name="gender" type="radio" value="0" <?= isset($_POST['gender']) && $_POST['gender'] == '0' ? "checked" : "" ?>/><label for="gender0">MENINO</label>
					<input id="gender1" name="gender" type="radio" value="1" <?= isset($_POST['gender']) && $_POST['gender'] == '1' ? "checked" : "" ?>/><label for="gender1">MENINA</label>
					<input id="gender2" name="gender" type="radio" value="2" <?= isset($_POST['gender']) && $_POST['gender'] == '2' ? "checked" : "" ?>/><label for="gender2">OUTRO</label>
					<input id="gender3" name="gender" type="radio" value="3" <?= isset($_POST['gender']) && $_POST['gender'] == '3' ? "checked" : "" ?>/><label for="gender3">PREFIRO NÃO DIZER</label>
					<img class="slidesjs-next slidesjs-navigation" src="img/next-btn.png"/>
					<img class="slidesjs-previous slidesjs-navigation" src="img/previous-btn.png"/>
				</div>
				<div>
					<img class="title" src="img/new-account.png"/>
					<label for="age">Idade: </label><input type="number" name="age" id="age" value="<?=isset($_POST['age']) ? $_POST['age'] : ""?>"/>
					<img class="slidesjs-next slidesjs-navigation" src="img/next-btn.png"/>
					<img class="slidesjs-previous slidesjs-navigation" src="img/previous-btn.png"/>
				</div>
				<div>
					<img class="title" src="img/new-account.png"/>
					<label for="parent-email">Email do responsável <span>(Você vai usar esse email para fazer login):</span></label>
					<input type="email" name="parent-email" id="parent-email" value="<?=isset($_POST['parent-email']) ? $_POST['parent-email'] : ""?>"/>
					<img class="slidesjs-next slidesjs-navigation" src="img/next-btn.png"/>
					<img class="slidesjs-previous slidesjs-navigation" src="img/previous-btn.png"/>
				</div>
				<div class="password-pick">
					<img class="title" src="img/new-account.png"/>
					<label for="password">Escolha uma senha:</label>
					<input type="password" name="password" id="password" required/>
					<br>
					<label for="password-confirmation">Confirme a senha:</label>
					<input type="password" name="password-confirmation" id="password-confirmation" required/>
					<img class="speech min-6-characters" src="img/speech-min-6-characters.png"/>
					<img class="speech equal-passwords" src="img/speech-equal-passwords.png"/>
					<img class="slidesjs-previous slidesjs-navigation" src="img/previous-btn.png"/><br>
					<input class="end-button" type="image" src="img/end-button.png" alt="Cadastrar!"/>
				</div>
			</form>
		</div>
		<?php include('footer.php'); ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/popup.js" type="text/javascript"></script>
		<script src="js/new-account.js" type="text/javascript"></script>
		<script src="js/mobile.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				<?php if($error != ""): ?>
					showPopup("Erro","<?=$error?>");
				<?php endif; ?>
			});
		</script>
	</body>
</html>

