<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Urbz - [Slogan]</title>
		<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/jumbotron.css"/>
		<link rel="stylesheet" type="text/css" href="css/about.css"/>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php
		$aboutClass = "current";
		$parentsClass = $helpClass = $rankingClass = ""; 
		include('header.php') 
		?>
		<div class="jumbotron active-slide1">
			<div class="content centralizer">
				<img src="img/arrow-left.png" class="slidesjs-previous slidesjs-navigation" alt="Anterior"/>
				<img src="img/arrow-right.png" class="slidesjs-next slidesjs-navigation" alt="Próximo"/>
				<div class="slide">
					<h1><img src="img/title-about1.png" alt="O que é?"/></h1>
					<!--<h2>Introdução</h2>-->
					<p>
						URBZ é o mundo virtual da Bradesco Seguros criado para crianças de 7 a 10 anos. O site apresenta conteúdo de experiência imersiva, no qual a criança interage com jogos e atividades por meio de um avatar.
					</p>
					<canvas id="fairy" width="380" height="550"></canvas>
				</div>
				<div class="slide">
					<h1><img src="img/title-about2.png" alt="Cidadania e Educação"/></h1>
					<!--<h2>Conteúdo educativo</h2>-->
					<p>
						As crianças participam de desafios que estimulam o raciocínio e acompanham o desenvolvimento infantil. Os conceitos de cidadania e educação estão presentes em todos os games de forma criativa e desafiadora, permitindo que o público aprenda de fato a viver em sociedade.
					</p>
					<canvas id="doctor" width="400" height="450"></canvas>
				</div>
				<div class="slide">
					<h1><img src="img/title-about3.png" alt="Segurança"/></h1>
					<!--<h2>Ambiente seguro</h2>-->
					<p>
						Segurança é uma das palavras de ordem da URBZ. O ambiente é 100% protegido e cuidado para que as crianças se divirtam sem riscos. Todos os dados pessoais são mantidos em sigilo.
					</p>
					<canvas id="cop" width="380" height="550"></canvas>
				</div>
				<div class="slide">
					<h1><img src="img/title-about4.png" alt="Avatar"/></h1>
					<!--<h2>Personagem com a cara do jogador</h2>-->
					<p>
						 A brincadeira começa com a criação do avatar. O personagem permite que a criança participe de um mundo de possibilidades divertidas, e escolha com quais atividades quer interagir. A aparência do avatar fica por conta da imaginação das crianças.
					</p>
					<canvas id="avatar" width="511" height="724"></canvas>
				</div>
				<div class="slide">
					<h1><img src="img/title-about5.png" alt="Mini Jogos"/></h1>
					<!--<h2>Mais jogos</h2>-->
					<p>
						Por meio de mecânicas inovadoras, os desafios vão evoluindo à medida que a criança avançar na brincadeira. Quanto mais tarefas, mais bonificações. Estes prêmios aparecem como medalhas e moedas, que ajudam o avatar na hora de conquistar roupas, acessórios e objetos.
					</p>
					<canvas id="minigames" width="268" height="212"></canvas>
				</div>
				<div class="slide">
					<h1><img src="img/title-about6.png" alt="Construa"/></h1>
					<!--<h2>Uma cidade divertida</h2>-->
					<p>
						Na URBZ a criança inventa sua própria cidade e define qual construção deve ocupar os espaços. Assim, além de aprender noções espaciais, a experiência possibilita contato com fundamentos de administração financeira, e conduzem à criança a entender melhor como cuidar de seus pertences.
					</p>
					<canvas id="buildings" width="250" height="250"></canvas>
				</div>
			</div>
			<div class="divider"></div>
			<a href="<?= (User::isUserLogged($conn) ? 'game.php' : 'login.php') ?>" class="play-btn"><img src="img/player-btn.png"/></a>
		</div>
		
		<canvas id="plane" width="830" height="170"></canvas>
		<div class="centralizer" id="content">
			<img src="img/clouds.png"/>
		</div>
		<div id="city"> </div>
		<!--<img src="img/city.jpg" style="width:100%; height:auto; margin-bottom:-4px;"/>-->
		
		<?php include('footer.php') ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/about.js" type="text/javascript"></script>
	</body>
</html>



