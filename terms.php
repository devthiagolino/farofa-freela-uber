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
		<link rel="stylesheet" type="text/css" href="css/privacy_terms.css"/>
		<?php if($detect->isMobile()): ?>
			<link rel="stylesheet" type="text/css" href="css/mobile.css" />
		<?php endif; ?>
		<link rel="icon" type="image/ico" href="favicon.ico"> 
	</head>
	<body>
		<?php
		/*$helpClass = "current";
		$rankingClass = $aboutClass = $parentsClass = "";*/ 
		include('header.php');
		?>
		
		<div id="content" class="centralizer">
			<nav><a class="selected" href="terms.php">TERMOS DE USO</a><a href="privacy.php">PRIVACIDADE</a></nav>
			<div>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam tortor sit amet risus lobortis porta. Duis convallis scelerisque orci, scelerisque blandit enim egestas et. Nam vestibulum est tincidunt ex accumsan, quis pulvinar felis porttitor. Aenean maximus et odio in venenatis. Cras at elit sit amet lorem placerat tincidunt sit amet id nunc. Suspendisse consequat diam quis mauris varius pulvinar. Pellentesque venenatis tortor elit, porta scelerisque lorem semper sed. Maecenas in mi id metus vestibulum lacinia at sed lectus.</p>
				<p>Aliquam eleifend dui ut mollis gravida. Suspendisse laoreet blandit tellus sed sodales. Pellentesque eu leo sed odio consequat tincidunt sed at arcu. Ut bibendum viverra facilisis. Donec placerat lorem ut ornare viverra. Phasellus porta turpis leo, sit amet tempor ante rhoncus nec. Mauris sit amet dolor nec eros eleifend commodo quis sed lectus. Phasellus ac risus ante. Pellentesque in mi id lacus hendrerit feugiat sit amet vel mi. Phasellus molestie consectetur nunc, ut egestas diam porttitor a. Nulla pretium diam at varius efficitur. Aenean eget sem eget nibh dictum dapibus a a nisi.</p>
				<p>Donec augue sem, auctor vel justo eget, varius accumsan odio. Integer sodales non ante ac molestie. Suspendisse laoreet libero non purus cursus, nec sollicitudin metus laoreet. Etiam laoreet pulvinar accumsan. In faucibus porta metus sed varius. Phasellus risus neque, aliquet a magna ac, suscipit fermentum sapien. Morbi ac urna bibendum, sagittis ipsum vitae, tempus ipsum. Morbi eu blandit risus. Nulla dolor diam, interdum quis magna et, fringilla dignissim ante. Sed ac finibus libero.</p>
				<p>Nulla tristique at massa vel ullamcorper. Sed in erat gravida, dignissim sem eu, vehicula erat. Ut in purus est. Cras luctus tincidunt nisi. Praesent laoreet vitae nibh at aliquet. Aliquam suscipit, enim quis tempor vehicula, libero justo efficitur leo, id cursus nibh ipsum nec nisl. Nullam lobortis ipsum ut nulla varius suscipit. Mauris tempus purus ac ornare vehicula. Nam tincidunt laoreet eros, quis pretium ex lacinia sit amet. Duis eu ipsum pulvinar sem porta consectetur vel id mi. Praesent ultricies tortor id lorem mollis, sed mattis magna aliquam. Morbi rhoncus auctor cursus. Vivamus venenatis lacus eros, ut vestibulum purus eleifend ut. Nunc feugiat dui in massa sodales interdum.</p>
				<p>Suspendisse molestie, elit eget feugiat cursus, magna risus suscipit augue, sed volutpat lectus tellus id urna. Nunc et est ut neque semper porta a sit amet turpis. Nunc euismod nisl purus, eu fringilla diam vehicula eget. Praesent ac tortor nec tellus volutpat convallis quis in lorem. Phasellus eu nunc in libero viverra scelerisque et vel libero. Donec pharetra nunc porta, porttitor erat eget, euismod mi. Sed eget augue quis nisi porttitor pellentesque. Vivamus sit amet sem nisl. Nunc hendrerit orci mollis justo varius, tristique dignissim risus sollicitudin. In euismod lorem ut ligula sollicitudin, suscipit lacinia ipsum tempor. Sed non massa vitae tellus luctus tincidunt quis vitae mauris. Vivamus faucibus tortor id augue bibendum convallis. Proin finibus justo purus.</p>
			</div>
		</div>
		
		<?php include('footer.php') ?>
		<script src="https://code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="js/jquery.slides.min.js" type="text/javascript"></script>
		<script src="js/bradesco-menu.js" type="text/javascript"></script>
		<script src="js/sprite-animation.js" type="text/javascript"></script>
	</body>
</html>



