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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/fonts.css"/>
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<link rel="stylesheet" type="text/css" href="css/help.css"/>
	<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
	<?php endif; ?>
	<link rel="icon" type="image/ico" href="favicon.ico"> 
</head>
<body>
	<div class="corpo">
		<?php
		$helpClass = "current";
		$rankingClass = $aboutClass = $parentsClass = ""; 
		include('header.php');
		?>
		
		<div id="content" class="centralizer">
			<div class="search">
				<p>Dificuldades? Relaxa que tiramos todas as suas dúvidas!</p>
				<form onsubmit="return false">
					<input type="text" placeholder="O que você deseja saber?"/>
					<input type="submit" value="OK">
				</form>
			</div>
			<?php if(!$detect->isMobile()): ?>	
				<img src="img/help-header.png"/>
			<?php else: ?>
				<div class="img-help-mobile"></div>
			<?php endif; ?>


			
				<nav class="<?php echo ($detect->isMobile()) ? 'mobile' : '' ?>">
					<div class="help-category register active"><span>TECNOLOGIA E SUPORTE</span></div>
					<div class="help-category world"><span>ÁREA DOS PAIS</span></div>
					<div class="help-category safety"><span>AVATAR</span></div>
					<div class="help-category parents"><span>JOGO</span></div>
					
					<?php if ($detect->isMobile()): ?>
						<span class="up-down-toogle"></span>	
					<?php endif; ?>					
			
					<!--<div class="help-category register active"><span>CADASTRO</span></div>
					<div class="help-category world"><span>MUNDO<br>VIRTUAL</span></div>
					<div class="help-category safety"><span>SEGURANÇA</span></div>
					<div class="help-category parents"><span>PAIS</span></div>
					<div class="help-category friends"><span>AMIGOS</span></div>
					<div class="help-category games"><span>MINIJOGOS</span></div>-->					
				</nav>
			

			<ul class="help-page" id="register">
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Qual tecnologia necessária para jogar o URBZ?					
					</div>
					<div class="answer">
						É preciso ter um computador com Unity WebPlayer.			
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O jogo roda em celular e tablet?					
					</div>
					<div class="answer">
						Não, só computador de mesa ou desktop.					
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como instalar o Unity WebPlayer?					
					</div>
					<div class="answer">
						Entre no link <a target="_BLANK" href='http://unity3d.com/webplayer/'>http://unity3d.com/webplayer/</a> e clique em download. Depois, siga as instruções. Você provavelmente vai precisar reiniciar seu navegador após a instalação.					
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como instalar o DirectX no Windows?					
					</div>
					<div class="answer">
						Você pode seguir os passos apresentados na página de suporte da própria Microsoft: <a target="_BLANK" href='http://support.microsoft.com/kb/179113/pt-br'>http://support.microsoft.com/kb/179113/pt-br</a> .					
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O jogo não roda no Google Chrome no MacOS?					
					</div>
					<div class="answer">
						Infelizmente o Chrome do Mac não permite o funcionamento do Unity WebPlayer. Mas você pode jogar de outro navegador, como o Safari ou o Firefox.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O que fazer se a tela demorar a carregar?
					</div>
					<div class="answer">
						<p>Esperar muito tempo a tela carregar não é legal para ninguém. Por isso, a URBZ passa algumas dicas para evitar que essa questão.</p>
						<p>A primeira delas é atualizar a página do mundo virtual. Basta clicar naquela setinha em circulo que fica no topo do navegador.</p>
						<p>Se ainda estiver um pouco lento, espere alguns minutinhos e atualize novamente.</p>
						<p>Você pode também limpar o cache (se não souber como a gente explica a você aqui logo abaixo) e caso não funcione, mande um e-mail para o <a href="contact.php">Suporte</a>.</p>
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como limpar o cache?					
					</div>
					<div class="answer">
						<p>Primeiro você precisa verificar qual é o navegador que gosta de usar: Internet Explorer, Chrome, Firefox ou Safari. Garanta que está utilizando a última versão para diminuir as questões que podem aparecer. Depois, basta seguir o passo a passo adequado mostrado abaixo. É simples.</p> 
						<h4>Internet Explorer</h4>
						<p>Clique na engrenagem que fica no canto direito superior do navegador. Na sequencia, selecione EXCLUIR na seção de HISTÓRICO. Depois, escolha ARQUIVOS DE INTERNET TEMPORÁRIOS na aba EXCLUIR HISTÓRICO DE NAVEGAÇÃO. Clique em EXCLUIR e feche e abra o navegador para iniciar a seção novamente.</p>
						
						<h4>Chrome</h4>
						<p>Selecione o ícone de três barrinhas que aparece no canto superior direito da tela. Escolha HISTÓRICO e em seguida LIMPAR DADOS DE NAVEGAÇÃO. Selecione CACHE e clique no botão LIMPAR. Depois é só atualizar o navegador.</p>
						<h4>Firefox</h4>
						<p>Clique no ícone de três barrinhas que fica no canto direito superior. Escolha PREFERÊNCIA, depois AVANÇADO e em seguida REDE. Aperte LIMPAR AGORA para CACHE DE CONTEÚDO WEB.</p>
						<h4>Safari</h4>
						<p>Clique em SAFARI e, na sequência, PREFERÊNCIAS. Selecione AVANÇADO. Depois, escolha MOSTRAR DESENVOLVEDOR NA ÁREA DE MENU. Em DESENVOLVEDOR selecione ESVAZIAR CACHE.</p>	
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O que fazer se depois de limpar o cachê o erro continuar?					
					</div>
					<div class="answer">
						Isso pode indicar alguma questão na Unity. Por isso é aconselhável entrar no site (<a target="_BLANK" href='http://unity3d.com/webplayer/'>http://unity3d.com/webplayer/</a>) e atualizar o programa. Se o erro continuar, mande um e-mail para o <a href="contact.php">suporte do URBZ</a>.
					</div>
				</li>
			</ul>
			<ul class="help-page" id="world">
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Ativação da conta
					</div>
					<div class="answer">
						Assim que a criança criar o avatar, a conta estará ativa e um e-mail será enviado ao responsável informando o cadastro no site.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como acessar o Cantinho dos Pais?					
					</div>
					<div class="answer">
						O pai recebe um email com o cadastro do filho dentro do Mundo virtual. Nesse email consta uma senha temporária para acesso ao Cantinho dos Pais. Essa senha é temporária, por isso é preciso trocar o registro por um mais seguro.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						É possível ter mais que uma conta de criança associada a um e-mail de responsável?					
					</div>
					<div class="answer">
						Sim, é possível. Assim você consegue administrar a brincadeira de todos os seus filhos ao mesmo tempo.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Qual a importância do Cantinho dos Pais?					
					</div>
					<div class="answer">
						O Cantinho dos Pais é um painel de gerenciamento da criança dentro do URBZ. Nesse local, o pai pode trocar a senha dele e do filho e ainda acompanhar o histórico das atividades da criança. O relatório apresenta algumas informações importantes como: qual foi o último acesso ao site, quantas horas ficou conectado, tempo de permanência nas atividades e minijogos.
					</div>
				</li>
			</ul>
			<ul class="help-page" id="safety">
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como crio um avatar no URBZ?					
					</div>
					<div class="answer">
						É muito fácil e também bastante divertido esse processo. As crianças só precisam clicar no botão JOGAR, que fica na home do mundo virtual. Depois, devem dizer que ainda não são cadastrados no site. Então, é só seguir o passo a passo colocando as informações como apelido do avatar.  E o personagem está pronto.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						É possível mudar o nome do avatar depois criá-lo?					
					</div>
					<div class="answer">
						Não, infelizmente. Por isso é importante ser bem criativo e pensar com cuidado antes de criar um personagem. O uso de informações pessoais ou termos de baixo calão bloqueará o nome do avatar. A preocupação do URBZ é que o público se divirta com segurança.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O que a criança pode fazer caso esqueça o nome de usuário?					
					</div>
					<div class="answer">
						Há dois caminhos para recuperar a informação. Caso a criança se lembre do e-mail que utilizou para cadastrar o avatar é só pedir ao responsável para entrar no Cantinho dos Pais e verificar os nomes de personagem criados. Caso não se lembre, não tem problema. O responsável deve enviar um e-mail para a <a href="contact.php">área de suporte da URBZ</a>.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						O que fazer se receber um erro de usuário ou de senha?					
					</div>
					<div class="answer">
						<p>Veja se a tecla CAPS LOCK (que deixa as letras maiúscula) está selecionada. Se tiver, desabilite.</p>
						<p>Confira se seu filho digitou o e-mail e a senha do avatar certinho.</p> 
						<p>E se a mensagem de erro continuar, mande um e-mail para o <a href="contact.php">suporte da URBZ</a>.</p>
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como mudar a senha do avatar?					
					</div>
					<div class="answer">
						A criança deve clicar em ESQUECI MINHA SENHA, que fica logo abaixo do campo de LOGIN. Um email será enviado para o e-mail do responsável cadastrado.
					</div>
				</li>
			</ul>
			<ul class="help-page" id="parents">
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como desativar a música e o som?					
					</div>
					<div class="answer">
						Para fazer a música parar enquanto joga no URBZ, basta clicar no canto direito da parte de cima. O ícone de engrenagem permite que edite as informações do jogo incluindo o som do site.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como funciona o bate-papo?					
					</div>
					<div class="answer">
						Para a criança conversar com os seus amigos dentro do site deve utilizar a ferramenta do bate-papo. Trata-se de uma barra fixa colocada na parte inferior da tela. A criança pode utilizar o menu rápido, ao escolher frases prontas, ou escolhe digitar ela mesma as palavras. Ao escrever no teclado, as palavras vão sendo completadas. Só aparecerão termos cadastrados no banco para garantir a segurança do público. Nenhuma informação pessoal ou privilegiada poderá ser enviada.
					</div>
				</li>
				<li>
					<a class="help-btn" href="#"></a>
					<div class="question">
						Como aceitar pedido de amizades dentro do URBZ?					
					</div>
					<div class="answer">
						Para adicionar novos amigos a criança precisa clicar no avatar do colega. Vai aparecer um card com todas as informações de jogo daquele usuário. Então, é só adicionar o amigo.
					</div>
				</li>
			</ul>
		</div>
		
		<?php include('footer.php') ?>

	</div>
	<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="js/jquery.slides.min.js" type="text/javascript"></script>
	<script src="js/bradesco-menu.js" type="text/javascript"></script>
	<script src="js/sprite-animation.js" type="text/javascript"></script>
	<script src="js/help.js" type="text/javascript"></script>
	<script src="js/mobile.js" type="text/javascript"></script>
</body>
</html>



