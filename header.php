<?php 
if(!isset($aboutClass) || !isset($parentsClass) || !isset($helpClass) || !isset($rankingClass)) {
	$parentsClass = $aboutClass = $helpClass = $rankingClass = ""; 
}
?>
<?php if(!$detect->isMobile()): ?>
	<audio class="girl-sound">
		<source src="sound/grunt_female_01.wav"></source>
	</audio>
	<audio class="girl-sound">
		<source src="sound/grunt_female_02.wav"></source>
	</audio>
	<audio class="girl-sound">
		<source src="sound/grunt_female_03.wav"></source>
	</audio>
	<audio class="boy-sound">
		<source src="sound/grunt_male_01.wav"></source>
	</audio>
	<audio class="boy-sound">
		<source src="sound/grunt_male_02.wav"></source>
	</audio>
	<audio class="boy-sound">
		<source src="sound/grunt_male_03.wav"></source>
	</audio>
	<audio class="play-sound">
		<source src="sound/click_home.wav"></source>
	</audio>
<?php endif; ?>	

<header class="full-width">

	<?php if( !$detect->isMobile() ): ?>
		<nav class="centralizer">
			<img id="bradesco-btn" src="img/btadesco-btn.png" alt="Serviços Bradesco"/>
			<a class="link <?=$aboutClass?>" href="about.php"><span>O que é?</span></a>
			<a class="link <?=$parentsClass?>" href="parents.php"><span>Pais e<br/>responsáveis</span></a>
			<div class="logo">
				<a href="index.php"><img src="img/logo.png" alt="Urbz"/></a>
			</div>
			<a class="link <?=$helpClass?>" href="help.php"><span>Ajuda</span></a>
			<a class="link <?=$rankingClass?>" href="ranking.php"><span>Ranking</span></a>
			<?php 
			if(!User::isUserLogged($conn)): 
				if($parentsClass.$helpClass.$rankingClass == ""):
					?>
				<a class="link login" href="login.php"><img src="img/login-btn.png" alt="Login"/></a>
				<?php 
				else:
					?>
				<a class="link login" href="login.php"><img src="img/play-btn.png" alt="Jogar"/></a>
				<?php
				endif;
				else: 
					User::getUser()->updateData($conn);
				?>
				<div class="link" id="logged">
					<img src="uploads/<?= User::getUser()->getAvatarUrl() ?>"/>
					<br>
					<span class="name"><?= User::getUser()->getScreenName() ?></span>
					<br>
					<a href="index.php?logout">SAIR</a>
				</div>
				<?php 
				endif;
				if($parentsClass != "" && User::isParentLogged($conn)): 
					?>
				<div class="info">
					<p>Olá <span><?= User::getUser()->getScreenName() ?></span>!</p>
					<a href="parent-password-change.php" id="change-password-btn">Trocar senha</a><br>
					<a href="index.php?logout" id="leave-btn">SAIR</a>
				</div>
			<?php endif; ?>
			<br style="clear:both"/>
		</nav>
	<?php else: ?>

		<nav class="nav-mobile">
			<img id="bradesco-btn" src="img/btadesco-btn.png" alt="Serviços Bradesco"/>
			<div class="logo">
				<a href="index.php"><img src="img/logo.png" alt="Urbz"/></a>
			</div>
			<a href="javascript:;" title="Menu" class="toogle">toggle</a>
			<ul id="list-mobile">
				<li>
					<a class="link " href="./new-account.php"><span>Cadastre-se</span></a>
				</li>
				<li>
					<a class="link <?=$parentsClass?>" href="parents.php"><span>Pais e<br/>responsáveis</span></a>
				</li>
				<li>
					<a class="link <?=$helpClass?>" href="help.php"><span>Ajuda</span></a>		
				</li>
				<li>
					<a class="link <?=$rankingClass?>" href="ranking.php"><span>Ranking</span></a>
				</li>
			</ul>
		</nav>

	<?php endif; ?>
	<!--<div class="bradesco-menu">
		<nav class="centralizer">
			<a href="#">Automóvel</a>
			<a href="#">Capitalização</a>
			<a href="#">Dental</a>
			<span class="spacer"> </span>
			<a href="#">Previdência</a>
			<a href="#">Residencial</a>
			<a href="#">Saúde</a>
		</nav>		
	</div>-->
</header>