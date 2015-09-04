<?php
	include('user.php');
	include('connection.php');	
	include('common.php');

	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();
	
	User::ifParentLoggedRedirect('parents_area.php',$conn);
	
	$error = "";
	
	if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email']) && isset($_POST['password'])) {
		$email = $_POST['email'];
		$password = $_POST['password'];
		
		if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			//Email em formato incorreto
			//TODO: avisar o erro no email
			goto end;
		}
		
		$result = $conn->prepare('SELECT id, password, salt, user_hash FROM parent WHERE email=?');
		$result->bind_param('s',$email);
		$result->execute();
		
		$res = $result->get_result();
		
		if($res->num_rows == 0) {
			//Email inexistente
			//TODO: avisar erro
			goto end;
		}
		
		$parent = $res->fetch_assoc();
		
		if($parent['password'] == hash('sha256', $password.$parent['salt'])) {
			User::loginParent($parent['user_hash'], $conn);
			header('location: parents_area.php');
		}
		else {
			$error = 'Não foi possível fazer o login usando essa combinação de email e senha. Clique em \"Esqueceu sua senha?\" para recuperar seu acesso.';
			$error = 'Ops! Dados incorretos. Preencha novamente :)';
			goto end;
		}
	}
	
	end:
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/fonts.css"/>
		<link rel="stylesheet" href="css/common.css"/>
		<link rel="stylesheet" href="css/jumbotron.css"/>
		<link rel="stylesheet" href="css/parents.css"/>
		<link rel="stylesheet" href="css/popup.css"/>
		<link rel="stylesheet" href="css/tooltip.css"/>
		<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
		<?php endif; ?>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
	<div class="corpo">
		<?php include('popup.php') ?>
		
		<div class="black-background">
			<div class="remember-password-window window">
				<img src="img/remember-password-text.png" class="cop-speech"/>
				<img class="close" src="img/delete-character-cancel-btn.png"/>
				<img class="confirm" src="img/delete-character-confirm-btn.png"/>
				<p>Preencha o campo abaixo <br> e receba sua senha por e-mail:</p>
				<span class="error"></span>
				<label for="remember-email">E-mail cadastrado:</label>
				<input name="remember-email" id="remember-email" type="email"/>
			</div>
			
			<div class="new-parent-account-window window">
				<p>
					Ainda não é cadastrado? Verifique com seu filho se existe uma conta criada. Caso ele tenha um avatar, você pode clicar em 'Esqueceu sua senha?' para recuperar o acesso ao Cantinho dos Pais. Se ele ainda não tem cadastro, é necessário fazer um avatar para a criança antes de realizar o acesso na área dos responsáveis.
				</p>
				<a href="#" class="forgot">Esqueceu sua senha?</a>
				<img class="close" src="img/delete-character-cancel-btn.png"/>
				<a href="login.php?logout" class="new-parent-account-btn"><img src="img/new-parent-account-btn.png"/></a>
			</div>
		</div>
		
		<?php
		$parentsClass = "current";
		$aboutClass = $helpClass = $rankingClass = ""; 
		include('header.php') 
		?>
		<div class="jumbotron active-slide1">
			<div class="content centralizer">
				<div class="content-left">
					<?php if(!$detect->isMobile()): ?>
						<img src="img/parents-main.png" alt="Cantinho dos Pais" />
					<?php else: ?>
					<div class="img-topo">
						<img src="img/mobile/parents/Titulo.png" alt="Cantinho dos Pais">
					</div>
					<?php endif; ?>
				</div>
				<div class="content-right">
					<h2>Seja bem-vindo à área de controle às atividades do (a) seu (sua) filho (a)!</h2>
					<div class="error"><?=$error?></div>
					<form action="parents.php" method="post">
						<label for="email">E-mail dos pais ou responsável</label>
						<input type="email" id="email" name="email" required/>
						<img class="form-help tooltip" src="img/form-help-btn.png" title="Insira o e-mail cadastrado pelo seu filho na URBZ para acessar o Cantinho dos Pais, seu painel de gerenciamento no site."/>
						<!--<img id="email-box" class="form-help-box" src="img/form-help-box.png"/>-->
						<label for="password">Senha dos pais ou responsável</label>
						<input type="password" id="password" name="password" required/>
						<img class="form-help tooltip" src="img/form-help-btn.png" title="A senha temporária foi a você enviada junto ao e-mail de boas vindas!"/>
						<div class="login-help">
							<a class="no-account" href="#">Ainda não é cadastrado?</a>
							<a class="forgot" href="#">Esqueceu sua senha?</a>
						</div>
						<input type="image" src="img/parent-login-btn.png" alt="Entrar!"/>
					</form>
				</div>
			</div>
			<div class="divider"></div>
			<?php if(!$detect->isMobile()): ?>
				<img src="img/parents-clouds.png" alt="Mas para que serve o cantinho dos pais?" class="clouds"/>
			<?php else: ?>
				<img src="img/mobile/parents/PraQueServe_vertical.png" alt="Mas para que serve o cantinho dos pais?" class="clouds"/>			
			<?php endif; ?>
		</div>
		
		<div class="centralizer" id="content">
			<div class="parents common">
				<div>
					<img src="img/parents1.png"/>
					<p>O URBZ oferece relatórios completos para você acompanhar as atividades do (a) seu (sua) filho (a).</p>
				</div>
				<div>
					<img src="img/parents2.png"/>
					<p>O Cantinho dos Pais permite que você tenha acesso a um relatório completo das atividades da criança no site.  </p>
				</div>
				<div>
					<img src="img/parents3.png"/>
					<p>Neste painel, você pode alterar as informações de cadastro, incluindo sua senha e a senha de acesso da criança, tudo em ambiente seguro.</p>
				</div>
			</div>

			<div class="parents tablet">
				<div>
					<img src="img/mobile/parents/item1_horizontal.png"/>
					<p>O URBZ oferece relatórios completos para você acompanhar as atividades do (a) seu (sua) filho (a).</p>
				</div>
				<div>
					<img src="img/mobile/parents/item2_horizontal.png"/>
					<p>O Cantinho dos Pais permite que você tenha acesso a um relatório completo das atividades da criança no site.  </p>
				</div>
				<div>
					<img src="img/mobile/parents/item3_horizontal.png"/>
					<p>Neste painel, você pode alterar as informações de cadastro, incluindo sua senha e a senha de acesso da criança, tudo em ambiente seguro.</p>
				</div>
			</div>

		</div>
		
		<?php include('footer.php') ?>
		</div>
		<script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/tooltip.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/popup.js" type="text/javascript"></script>
		<script src="js/parents.js" type="text/javascript"></script>
		<script src="js/mobile.js" type="text/javascript"></script>
		<script type="text/javascript">
		 	$('.tooltip').tooltipster({'position':'top-right','arrow':false,'animation':'fade'});
		</script>
	</body>
</html>



