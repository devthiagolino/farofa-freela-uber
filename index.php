<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	include('src/isMobile/Mobile_Detect.php');
	$detect = new Mobile_Detect();

if(isset($_GET['logout']) && User::isAnyLogged($conn)) {
	User::logout($conn);
	header('location: index.php');		
	die; 
}
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Urbz - [Slogan]</title>
	<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<link rel="stylesheet" type="text/css" href="css/jumbotron.css"/>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
	<?php endif; ?>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.css"/>
	<link rel="icon" type="image/ico" href="favicon.ico"> 
</head>
<body>
	<div class="corpo">
		<?php
		$parentsClass = $aboutClass = $helpClass = $rankingClass = ""; 
		include('header.php') 
		?>
		<!--<img style="position:absolute;opacity:0.5;z-index:1000" src="_img-ruler.png"/>-->
		<div class="jumbotron">
			<div class="content centralizer">
				<?php if ( $detect->isMobile() ) : ?>			
					<div class="logo-expansivel-mobile">
						<img src="img/mobile/home/logo_expansivel.png">
					</div>
					<div class="video-img-mobile">						
						<a href="about.php">
							<img src="img/mobile/home/Topo_pessoas.png">
						</a>
					</div>
				<?php elseif( !$detect->isMobile() ): ?>
					<div class="video">
						<a href="#"><img src="img/video.png"/></a>
					</div>	
					<!--<img class="character character2" src="img/character2.png"/>
					<img class="character character1" src="img/character1.png"/>
					<img class="character character3" src="img/character3.png"/>
					<img class="character character4" src="img/character4.png"/>-->
					<canvas class="character character2" width="250" height="500"></canvas> <!-- manager -->
					<canvas class="character character1" width="230" height="480"></canvas> <!-- nurse -->
					<canvas class="character character3" width="230" height="480"></canvas> <!-- guard -->
					<canvas class="character character4" width="220" height="520"></canvas> <!-- professor -->
					<img class="speak speak1" src="img/speak1.png"/>
					<img class="speak speak2" src="img/speak2.png"/>
					<img class="speak speak3" src="img/speak3.png"/>
					<img class="speak speak4" src="img/speak4.png"/>
				<?php endif; ?>							
			</div>

			<?php if( $detect->is('iOS') ) : ?>
				<div class="btn-apple">
					<a href="javascript:;">
						<img src="img/mobile/home/Baixar_appstore.png">
					</a>
				</div>
			<?php elseif( $detect->is('androidOS') ): ?>				
				<div class="btn-android">
					<a href="http://google.com">
						<img src="img/mobile/home/Baixar_android.png">
					</a>
				</div>
			<?php endif; ?>

			<div class="divider"></div>

			<?php if( !$detect->isMobile() ) : ?>	
				<a href="<?= (User::isUserLogged($conn) ? 'game.php' : 'login.php') ?>" class="play-btn">
					<!--<img src="img/player-btn.png"/>-->
					<canvas width="420" height="220"></canvas>
				</a>
			<?php endif; ?>
		</div>
		
		<div id="content">

			<?php if ( $detect->isMobile() ) : ?>
				<img src="img/mobile/home/divirta-se.png" class="mobile-divirta-se" title="Divirta-se">
			<?php elseif( $detect->isTablet() ||  !$detect->isMobile() ): ?>
				<img src="img/middle-text.png">
			<?php endif; ?>
			
			<div class="about centralizer">
				<?php if ( $detect->isMobile() ) : ?>
					<a href="javascript:;"><img src="img/mobile/home/item1.png"></a>
					<a href="javascript:;"><img src="img/mobile/home/item2.png"></a>
					<a href="javascript:;"><img src="img/mobile/home/item3.png"></a>
				<?php elseif( $detect->isTablet() ): ?>					
					<a href="javascript:;"><img src="img/mobile/home/item1.png"></a>
					<a href="javascript:;"><img src="img/mobile/home/item2.png"></a>
					<a href="javascript:;"><img src="img/mobile/home/item3.png"></a>
				<?php elseif(!$detect->isMobile()): ?>	
					<!--<img src="img/about.png"/>
					<img src="img/about2.png"/>
					<img src="img/about3.png"/>-->
					<a href="about.php"><canvas class="about1" width="321" height="382"></canvas></a>
					<a href="about.php"><canvas class="about2" width="321" height="382"></canvas></a>
					<a href="about.php"><canvas class="about3" width="321" height="382"></canvas></a>
				<?php endif; ?>
			</div>

			<?php if($detect->isMobile()): ?>	
				<div class="mobile-o-que-e">
					<div class="content">
					<!--<img src="img/arrow-left.png" class="slidesjs-previous slidesjs-navigation" alt="Anterior"/>
					<img src="img/arrow-right.png" class="slidesjs-next slidesjs-navigation" alt="Próximo"/>-->
					<div class="slide cor-o-que-e">
						<h1><img src="img/title-about1.png" alt="O que é?"/></h1>
						<!--<h2>Introdução</h2>-->
						<img src="img/mobile/home/slide-o-que-e.png">
						<p>
							URBZ é o mundo virtual da Bradesco Seguros criado para crianças de 7 a 10 anos. O site apresenta conteúdo de experiência imersiva, no qual a criança interage com jogos e atividades por meio de um avatar.
						</p>
						<!--<canvas id="fairy" width="380" height="550"></canvas>-->
					</div>
					<div class="slide cor-medico">
						<h1><img src="img/title-about2.png" alt="Cidadania e Educação"/></h1>
						<!--<h2>Conteúdo educativo</h2>-->
						<img src="img/mobile/home/slide-medico.png">
						<p>
							As crianças participam de desafios que estimulam o raciocínio e acompanham o desenvolvimento infantil. Os conceitos de cidadania e educação estão presentes em todos os games de forma criativa e desafiadora, permitindo que o público aprenda de fato a viver em sociedade.
						</p>
						<!--<canvas id="doctor" width="400" height="450"></canvas>-->
					</div>
					<div class="slide cor-seguranca">
						<h1><img src="img/title-about3.png" alt="Segurança"/></h1>
						<!--<h2>Ambiente seguro</h2>-->
						<img src="img/mobile/home/slide-seguranca.png">
						<p>
							Segurança é uma das palavras de ordem da URBZ. O ambiente é 100% protegido e cuidado para que as crianças se divirtam sem riscos. Todos os dados pessoais são mantidos em sigilo.
						</p>
						<!--<canvas id="cop" width="380" height="550"></canvas>-->
					</div>
					<div class="slide cor-avatar">
						<h1><img src="img/title-about4.png" alt="Avatar"/></h1>
						<!--<h2>Personagem com a cara do jogador</h2>-->
						<img src="img/mobile/home/slide-avatar.png">
						<p>
							A brincadeira começa com a criação do avatar. O personagem permite que a criança participe de um mundo de possibilidades divertidas, e escolha com quais atividades quer interagir. A aparência do avatar fica por conta da imaginação das crianças.
						</p>
						<!--<canvas id="avatar" width="511" height="724"></canvas>-->
					</div>
					<div class="slide cor-em-apuros">
						<h1><img src="img/title-about5.png" alt="Mini Jogos"/></h1>
						<!--<h2>Mais jogos</h2>-->
						<img src="img/mobile/home/slide-em-apuros.png">
						<p>
							Por meio de mecânicas inovadoras, os desafios vão evoluindo à medida que a criança avançar na brincadeira. Quanto mais tarefas, mais bonificações. Estes prêmios aparecem como medalhas e moedas, que ajudam o avatar na hora de conquistar roupas, acessórios e objetos.
						</p>
						<!--<canvas id="minigames" width="268" height="212"></canvas>-->
					</div>
					<div class="slide cor-cristo">
						<h1><img src="img/title-about6.png" alt="Construa"/></h1>
						<!--<h2>Uma cidade divertida</h2>-->
						<img src="img/mobile/home/slide-cristo.png">
						<p>
							Na URBZ a criança inventa sua própria cidade e define qual construção deve ocupar os espaços. Assim, além de aprender noções espaciais, a experiência possibilita contato com fundamentos de administração financeira, e conduzem à criança a entender melhor como cuidar de seus pertences.
						</p>
						<!--<canvas id="buildings" width="250" height="250"></canvas>-->
					</div>
				</div>			
			</div>
		<?php endif; ?>


		<?php if(!$detect->isMobile()): ?>	
			<!--<img src="img/safe-environment-tag.png" class="safety-tag"/>-->
			<canvas class="safety-tag centralizer" width="700" height="220"></canvas>
		<?php else: ?>
			<div class="ambiente-seguro">
				<img src="img/mobile/home/AmbienteSeguro.png" alt="Ambiente Seguro para todos">
			</div>
		<?php endif; ?>

	</div>
	<?php include('footer.php') ?>
</div>
<script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery.slides.min.js" type="text/javascript"></script>
<script src="js/bradesco-menu.js" type="text/javascript"></script>
<script src="js/sprite-animation.js" type="text/javascript"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.min.js"></script>
<script src="js/mobile.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>		
</body>
</html>


