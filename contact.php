<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();

$success = false;
$p = $_SERVER['REQUEST_METHOD'] === 'POST'; 

if($p) {
	$to = 'lucas@farofastudios.com.br';
	$subject = "Contato Urbz [".$_POST['subject']."]";

	$message = "Nome: ".$_POST['name']."<br><br>";
	$message .= $_POST['message'];

		// Always set content-type when sending HTML email
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

		// More headers
	$headers .= 'From: '.$_POST['email']."\r\n";

	$success = mail($to,$subject,$message,$headers);
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
	<link rel="stylesheet" type="text/css" href="css/contact.css"/>
<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
	<?php endif; ?>	<link rel="icon" type="image/ico" href="favicon.ico"> 
</head>
<body>
	<div class="corpo">
		<?php
		/*$helpClass = "current";
		$rankingClass = $aboutClass = $parentsClass = "";*/ 
		include('header.php');
		?>
		
		<div id="content" class="centralizer">
			
			<img class="title" src="img/contact-title.png"/>			
			<img class="mayor" src="img/contact-character.png"/>

			<form method="POST">
				<div class="left">
					<label for="name">Qual seu nome?</label><input type="text" id="name" name="name" required value="<?= $p && !$success ? $_POST['name'] : '' ?>"/>
					<label for="email">Qual seu email?</label><input type="text" id="email" name="email" required value="<?= $p && !$success ? $_POST['email'] : '' ?>"/>
					<label for="subject">Sobre o que você quer conversar?</label><input type="text" id="subject" name="subject" required value="<?= $p && !$success ? $_POST['subject'] : '' ?>"/>
				</div>
				<div class="right">
					<label for="message">Escreva sua mensagem:</label><textarea id="message" name="message" required value="<?= $p && !$success ? $_POST['message'] : '' ?>"></textarea>
				</div>
				<input id="submit-contact" type="image" src="img/end-button.png"/>
				<?= $p && $success ? '<p class="success">Email enviado com sucesso!<p>' : $p ? '<p class="error">Ocorreu um problema com o envio da sua mensagem, por favor tente novamente.</p>' : '' ?>
			</form>
		</div>
		
		<?php include('footer.php') ?>
	</div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="js/jquery.slides.min.js" type="text/javascript"></script>
	<script src="js/bradesco-menu.js" type="text/javascript"></script>
	<script src="js/sprite-animation.js" type="text/javascript"></script>	
	<script src="js/mobile.js" type="text/javascript"></script>
	<script src="js/contact.js" type="text/javascript"></script>
</body>
</html>



