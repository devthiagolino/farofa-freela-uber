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
		<link rel="stylesheet" type="text/css" href="css/ranking.css"/>
		<?php if($detect->isMobile()): ?>
		<link rel="stylesheet" type="text/css" href="css/mobile.css" />
		<?php endif; ?>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
	<div class="corpo">
		<?php
		$rankingClass = "current";
		$aboutClass = $parentsClass = $helpClass = ""; 
		include('header.php') 
		?>
		
		<div id="content" class="centralizer">
			<?php if(!$detect->isMobile()): ?>
				<img src="img/ranking-header.png"/>
			<?php else: ?>	
				<div class="bg-header-ranking"></div>
			<?php endif; ?>
			<nav <?php echo ($detect->isMobile()) ? 'class="mobile"' : ''; ?>>
				<div class="ranking-category active urbzLevel"><span>URBZ</span></div>
				<div class="ranking-category noTrilhoDoTrem"><span>NO TRILHO<br>DO TREM</span></div>
				<div class="ranking-category emCimaDaFaixa"><span>EM CIMA<br>DA FAIXA</span></div>
				<div class="ranking-category obstakulos"><span>OBSTÁKULOS</span></div>
				<div class="ranking-category batalhaDosMitos"><span>BATALHA<br>DOS MITOS</span></div>
				<div class="ranking-category mordix"><span>MORDIX</span></div>
				<div class="ranking-category emApuros"><span>EM APUROS</span></div>
				<?php if ($detect->isMobile()): ?>
					<span class="up-down-toogle"></span>	
				<?php endif; ?>					
			</nav>
			<?php 
			$rankings = array('urbzLevel', 'urbzMoney', 'noTrilhoDoTrem', 'emCimaDaFaixa', 'obstakulos', 'batalhaDosMitos', 'mordix', 'emApuros');
			$selects = array(
			'urbzLevel' => 'SELECT p.id, p.screen_name, p.money, p.experience, i.url FROM player as p, player_icon as i WHERE i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 ORDER BY p.experience DESC',
			'urbzMoney' => 'SELECT p.id, p.screen_name, p.experience, p.money, i.url FROM player as p, player_icon as i WHERE i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 ORDER BY p.money DESC',
			'noTrilhoDoTrem' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 1 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			'emCimaDaFaixa' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 2 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			'obstakulos' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 3 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			'batalhaDosMitos' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 4 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			'mordix' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 5 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			'emApuros' => 
				'SELECT p.id, p.screen_name, p.experience, g.score, i.url '.
				'FROM player as p, game_ranking as g, player_icon as i '.
				'WHERE game_id = 6 AND g.player_id = p.id AND i.id = p.player_icon_id AND p.temporary = 0 AND p.deleted = 0 AND p.first_login = 0 '.
				'ORDER BY g.score DESC',
			);
			
			foreach($rankings as $ranking):
			?>
			<div id="<?=$ranking?>" class="ranking">
			<div class="image-header <?=$ranking?>"></div>
			<table>
				<tr>
					<th>APELIDO</th>
					<!--<th>
						<?= ($ranking == $rankings[0]) ? 
							"V NÍVEL" 
							: (($ranking == $rankings[1]) ? "<div class='inner urbzLevel'>&gt; NÍVEL</div>" : "NÍVEL" ) ?>
					</th>-->
					<th><?=
						($ranking == $rankings[0] || $ranking == $rankings[1]) ? 
							(($ranking == $rankings[1]) ? 
								"<span class='inner urbzMoney active'>MOEDAS</span><span class='inner urbzLevel'>NÍVEL</span>" 
							: 
								"<span class='inner urbzMoney'>MOEDAS</span><span class='inner urbzLevel active'>NÍVEL</span>"
							) 
							: "PONTUAÇÃO MÁXIMA" 
						?>
					</th>
				</tr>
			<?php
			$count = 0;
			$res = $conn->query($selects[$ranking]);
			$user = null;
			while($row = $res->fetch_row()):
				if(User::isUserLogged($conn) && User::getUser()->getId() == $row[0])
					$user = array(User::getUser(),$count+1,experienceToLevel($row[2]),$row[3]);
			?>
				<tr>
					<td class="name">						
						<div class="rank rank<?=$count+1?>">							
							<?=++$count?>
							<?php if (!$detect->isMobile()): ?>
								<?php if($count == 1): ?>
								<img src="img/medal-gold.png"/>
								<?php elseif($count == 2): ?>
								<img src="img/medal-silver.png"/>
								<?php elseif($count == 3): ?>
								<img src="img/medal-bronze.png"/>
								<?php endif; ?>
							<?php endif; ?>
						</div>
						<img src="uploads/<?=$row[4]?>"/>
						<p><?=substr($row[1],0,15)?></p>
					</td>
					<td>
						<?=$ranking == $rankings[0] ? experienceToLevel($row[3]) : $row[3]?>
					</td>
					<!--<td>
						<?=$row[3]?>
					</td>-->
				</tr>
			<?php
				if($count == 10) break;
			
			endwhile;
			if(User::isUserLogged($conn)):
				if($user != null):
			?>
				<?php if(!$detect->isMobile()): ?>
				<tr class="your-rank logged">
					<td class="name">
						<img class="left" src="img/your-rank-left.png"/>
						<div class="rank"><?=$user[1]?></div>
						<img class="icon" src="uploads/<?=$user[0]->getAvatarUrl();?>"/>
						<p><?=substr($user[0]->getScreenName(),0,15)?></p>
					</td>
					<td><?=$ranking == $rankings[0] ? experienceToLevel($user[3]) : $user[3]?></td>
					<!--<td>
						<?=$user[3]?>
						<img class="right" src="img/your-rank-right.png"/>
					</td>-->
				</tr>
				<?php endif; ?>
			<?php
				else:
			?>
			<?php if(!$detect->isMobile()): ?>
				<tr class="your-rank">
					<td colspan="3">
						<img class="left" src="img/your-rank-left.png"/>
						Você ainda não pontuou nesse jogo.
						<img class="right" src="img/your-rank-right.png"/>
					</td>
				</tr>
			<?php endif; ?>
			<?php
				endif;
			else:
			?>
				<?php if(!$detect->isMobile()): ?>
				<tr class="your-rank">
					<td colspan=3>
						<img class="left" src="img/your-rank-left.png"/>
						<a href="login.php">Faça o login</a> para ver sua posição no jogo!
						<img class="right" src="img/your-rank-right.png"/>
					</td>
				</tr>
				<?php endif; ?>
			<?php
			endif;
			?>
				<tr class="rank-end">
					<td></td>
					<td></td>
					<!--<td></td>-->
				</tr>
			</table>
			</div>
			<?php
			endforeach;
			?>
		</div>
		
		<?php include('footer.php') ?>
		</div>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/ranking.js" type="text/javascript"></script>
		<script src="js/mobile.js" type="text/javascript"></script>
	</body>
</html>



