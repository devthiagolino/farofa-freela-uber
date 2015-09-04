<?php
	include('connection.php');
	include('common.php');	
	include('user.php');
	
	User::ifUserLoggedRedirect('game.php',$conn);
	$error = "";
	if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['parent-email'])) {
		$parent_email = $_POST['parent-email'];
		
		if(!filter_var($parent_email, FILTER_VALIDATE_EMAIL)) {
			//Email em formato incorreto
			header('location: login.php?err=1');
			die();
		}
		
		$result = $conn->prepare('SELECT id FROM parent WHERE email=?');
		$result->bind_param('s',$parent_email);
		$result->execute();
		
		$res = $result->get_result();
		
		if($res->num_rows == 0) {
			//Email inexistente
			header('location: login.php?err=2');
			die();
		}
		
		$parent = $res->fetch_assoc();
		
		$result = $conn->prepare('SELECT p.*, i.url FROM player as p, player_icon as i WHERE p.parent_id=? AND p.player_icon_id = i.id');
		$result->bind_param('i',$parent['id']);
		$result->execute();
		
		$children = $result->get_result();
		
		if(isset($_POST['login']) && isset($_POST['password'])) {
			$result = $conn->prepare('SELECT password, salt, user_hash FROM player WHERE id=? AND parent_id = ?');
			$result->bind_param('ii',$_POST['login'],$parent['id']);
			$result->execute();
			
			$res = $result->get_result();
			
			if($res->num_rows == 0) {
				die('Nome de usuário inexistente.');
			}
			else {
				$user = $res->fetch_assoc();
				
				if($user['password'] == hash('sha256', $_POST['password'].$user['salt'])) {
					//$_SESSION['user'] = $user['user_hash'];
					User::loginUser($user['user_hash'], FALSE, $conn);
					header('location: game.php');
				}
				else {
					$error = 'Senha incorreta.';
				}
			}
		}
	}
	else {
		header('location: login.php');
	}
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<link rel="stylesheet" type="text/css" href="css/login2.css"/>
		<link rel="stylesheet" type="text/css" href="css/popup.css"/>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php include("popup.php") ?>
		<?php include("header.php") ?>
		<div id="content" class="centralizer">
			<img src="img/login2-title.png" style="width:345px;"/>
			<form action="login2.php" method="POST">
				<input type="hidden" name="parent-email" value="<?= $parent_email ?>"/>
				<?php while($row = $children->fetch_assoc()): ?>
				<div class="player">
					<input type="radio" id="<?= $row['id'] ?>" value="<?= $row['id'] ?>" name="login" required <?= $children->num_rows == 1 || $error != "" && $row['id'] == $_POST['login'] ? 'checked' : '' ?>>
					<label for="<?= $row['id'] ?>">
						<img src="uploads/<?=$row['url']?>"/>
						<?= strlen($row['screen_name']) > 0 ? $row['screen_name'] : $row['login'] ?>
					</label>
				</div>
				<?php endwhile; ?>
				<br>
				<p class="error" style="display:<?= $error != '' ? 'block' : 'none' ?>"></p>
				<?php $hidden_class = $children->num_rows == 1 || $error != "" ? '' : 'initially-hidden' ?>
				<label for="password" class="password-label <?=$hidden_class?>">Digite sua senha:</label>
				<input id="password" name="password" type="password" class="<?=$hidden_class?> <?=$error!=''?'validate':''?>" required/>
				<input type="image" src="img/parent-login-btn.png" class="<?=$hidden_class?>" alt="Jogar!"/>
				<p class="forgot <?=$hidden_class?>">Esqueceu sua senha?</p>
			</form>
		</div>
		<?php include('footer.php'); ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/popup.js" type="text/javascript"></script>
		<script src="js/login2.js" type="text/javascript"></script>
	</body>
</html>

















