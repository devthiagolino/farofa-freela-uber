<footer>
	
	<?php if(!$detect->isMobile()): ?>	
		<img class="rocket-station" src="img/rocket-station.png"/>	
	<?php endif; ?>
		
	<img class="security-tag" src="img/security-tag.png">
	
	<nav class="centralizer">
		
		<?php if(!$detect->isMobile()): ?>
			<div class="sponsor"><img src="img/bradesco-sponsor.png"/></div>
		

		<div class="sitemap">
			<div>
				<a href="about.php">O que é?</a>
				<a href="help.php">Ajuda</a>
				<!--<a href="parents.php">Pais e responsáveis</a>-->
				<a href="ranking.php">Ranking</a>
				<!--<a href="#">Faça você mesmo</a>-->
			</div>
			<div>
				<a href="contact.php"> Fale Conosco</a>
				<a href="#">Privacidade</a>
				<a href="#">Termos de Uso</a>
			</div>
			<div id="parents-area"><a href="parents.php">CANTINHO DOS PAIS</a></div>
		</div>

		<?php endif; ?>
		
		<div class="recent-login">
			<h3>Últimos Acessos</h3>
			<div>
			<?php
				$recent_users = $conn->prepare("SELECT * FROM (".
					"SELECT p.id, p.screen_name, a.date, v.url " . 
					"FROM analytic_data as a, player as p, player_icon as v " . 
					"WHERE a.type = 'login' AND a.player_id = p.id AND v.id = p.player_icon_id AND p.screen_name NOT LIKE '%visitante%' AND p.screen_name != '' " .
					"ORDER BY a.date DESC ".
					") AS r GROUP BY r.id ORDER BY r.date DESC LIMIT 6"
					);
				echo $conn->error;
				if($recent_users->execute()) {
					$res = $recent_users->get_result();
					$count = 0;
					while($row = $res->fetch_assoc()) {
						echo '<div class="recent-user">';
						echo '<img src="uploads/'.$row['url'].'"/><h1>'.$row['screen_name'].'</h1><span>'.humanTiming(strtotime($row['date'])).' atrás.</span>';
						echo '</div>';
						
						$count++;
						if($count == 3) {
							echo '</div><div>';
							$count = 0; 
						};
					}
					echo "</div>";
				}
				else {
					echo "Algo deu errado :(";
				}
			?>

			<?php if(!$detect->isMobile()): ?>	
				<a class="footer-play" href="<?= (User::isUserLogged($conn) ? 'game.php' : 'login.php') ?>">
					<!--<img class="" src='img/footer-play.png'/>-->
					<canvas width="250" height="220"></canvas>
				</a>	
			<?php endif; ?>		
			

		</div>

		<?php if($detect->isMobile()): ?>

		<div class="divider-footer"></div>
		
		<div class="button-mobile">
			<a class="app-store">
				<img src="img/mobile/home/down_app_store_360.png" alt="">
			</a>	
			<a class="google-play">
				<img src="img/mobile/home/down_google_play_360.png" alt="">
			</a>
		</div>

		<ul class="links-footer">
			<li><a href="./contact.php">Fale Conosco</a></li>
			<li><a href="./privacy.php">Privacidade</a></li>
			<li><a href="./terms.php">Termos de Uso</a></li>
		</ul>

		<?php endif; ?>

	</nav>
	<p>2015 © URBZ - Todos os direitos reservados</p>
	<div class="requirements">
		Cofigurações recomendadas: Navegador: Internet Explorer 11, Firefox 35, Chrome X. | Memória 1GB <br>
		Processador: Intel core 2 duo ou equivalente | Placa de Vídeo: NVIDIA GEFORCE 8600 GT ou equivalente
	</div>
</footer>