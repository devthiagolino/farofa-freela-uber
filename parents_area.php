<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	
	if(!User::isParentLogged($conn)) {
		header('location: index.php');
		die();
	}
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<link rel="stylesheet" href="css/fonts.css"/>
		<link rel="stylesheet" href="css/common.css"/>
		<link rel="stylesheet" href="css/jumbotron.css"/>
		<link rel="stylesheet" href="css/parents_area.css"/>
		<link rel="stylesheet" href="css/tooltip.css"/>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php
		$parentsClass = "current";
		$aboutClass = $helpClass = $rankingClass = ""; 
		include('header.php') 
		?>
		
		<div class="black-background">
			
			<div class="window" id="delete-character-confirmation">
				<img class="confirm" src="img/delete-character-confirm-btn.png"/>
				<img class="cancel" src="img/delete-character-cancel-btn.png"/>
				<img class="cancel2" src="img/delete-character-cancel2-btn.png"/>
				<input type="hidden" name="hash" class="hash"/>
			</div>
			
			<div class="window" id="change-password">
				<img class="cancel" src="img/delete-character-cancel-btn.png"/>
				<img class="confirm" src="img/delete-character-confirm-btn.png"/>
				<p>Apelido: <br><span>MARYZINHA</span></p>
				<span id="error-field"></span>
				<form>
					<img class="cop-speech" id="default-speech" src="img/change-password-text1.png"/>
					<img class="cop-speech" id="different-speech" src="img/change-password-text2.png"/>
					<img class="cop-speech" id="length-speech" src="img/change-password-text3.png"/>
					<input type="hidden" name="hash" class="hash"/>
					<input type="hidden" name="isChild" id="isChild"/>
					<label for="password">Nova senha</label>
					<input type="password" name="password" id="password" required/>
					<label for="password-confirmation">Confirmar nova senha</label>
					<input type="password" name="password-confirmation" id="password-confirmation" required/>
				</form>
			</div>
			
			<div class="window" id="history-window">
				<img class="cancel" src="img/delete-character-cancel-btn.png"/>
				<div class="header">
					<p class="screenname">Apelido: <span>MARYZINHA</span></p>
					<p class="since"><span>Conta ativa desde: </span> 17 de fevereiro de 2015</p>
					<p class="last"><span>Último login: </span> 25 de fevereiro de 2015</p>
					<p class="total"><span>Tempo total dentro do URBZ: </span> 23h45min</p>
				</div>
				<div class="content-wrapper">
					<table class="content">
						
					</table>
				</div>
			</div>
			
		</div>
		
		<div class="centralizer" id="content">
			<div id="header">
				<img src="img/parents-area-logo.png" alt="Cantinho dos Pais"/>
				<div>
					<h2>Seja muito bem vindo!</h2>
					<p>
						Selecione um dos perfis cadastrados com seu e-mail para visualizar suas atividades e editar seus dados: 
					</p>
				</div>
			</div>
			<div id="children">
				<?php
				$parentId = User::getUser()->getId();
				$res = $conn->query("SELECT p.*, i.url FROM player as p, player_icon as i WHERE p.parent_id = $parentId AND i.id = p.player_icon_id LIMIT 4");
				
				while($row = $res->fetch_row()):
				?>
				<div class="child-card" hash="<?=$row[6]?>">
					<img class="delete" src="img/delete-child.png" alt="Apagar personagem"/>
					<h1><?= $row[3] ?></h1>
					<img class="player-icon" src="uploads/<?=$row[18]?>"/>
					<p class="screenname">Apelido: <span><?= substr($row[7],0,15) ?></span></p>
					
					<div class="child-info">
						<div class="info level">
							<span><?=experienceToLevel($row[10])?></span>
							<?php
							$currentExperience = $row[10];
							$currentLevel = experienceToLevel($currentExperience);
							$currentLevelExperience = levelToExperience($currentLevel);
							$nextLevelExperience = levelToExperience($currentLevel+1);
							
							$percentage = ($currentExperience-$currentLevelExperience)/($nextLevelExperience-$currentLevelExperience);
							?>
							<div><div style="width:<?=$percentage*100?>%"></div></div>
						</div>
						<div class="info money">
							<span><?=number_format($row[11],0,'','.')?></span>
						</div>
					</div>
					
					<div class="child-help">
						<img class="help-level tooltip" src="img/form-help-btn.png" title="O nível da cidade da criança. Quanto mais ela joga e constroi, mais experiência ela ganha."/>
						<br><br><br>
						<img class="help-money tooltip" src="img/form-help-btn.png" title="A quantidade de dinheiro da criança. Algumas construções geram dinheiro que pode ser usado para comprar roupas ou melhorias para a cidade."/>
					</div>
					
					<img class="change-pass-btn" src="img/child-card-change-pass.png" alt="Trocar senha"/>
					<img class="history-btn" src="img/child-card-history.png" alt="Trocar senha"/>
				</div>
				<?php
				endwhile;
				?>
			</div>
		</div>
		
		<?php include('footer.php') ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/tooltip.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/parents_area.js" type="text/javascript"></script>
		<script type="text/javascript">
		 	$('.tooltip').tooltipster({'position':'top-right','arrow':false,'animation':'fade'});
		</script>
	</body>
</html>



