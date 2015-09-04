<?php
	include('user.php');
	include('connection.php');
	include('common.php');
	
	User::ifUserLoggedRedirect('game.php',$conn);
	
	$tempName = '[Visistante]'.bin2hex(openssl_random_pseudo_bytes(8));
	$tempCharacterName = '[Visitante]'.hexdec(bin2hex(openssl_random_pseudo_bytes(2)));
	$tempGender = 2;
	$tempAge = 0;
	$tempParentEmail = bin2hex(openssl_random_pseudo_bytes(8))."@".bin2hex(openssl_random_pseudo_bytes(8)).".com";
	$tempPassword = bin2hex(openssl_random_pseudo_bytes(16));
	
	$data = array(
		'name' => $tempName, 
		'character-name' => $tempCharacterName, 
		'gender' => $tempGender, 
		'age' => $tempAge, 
		'parent-email' => $tempParentEmail, 
		'password' => $tempPassword, 
		'password-confirmation' => $tempPassword,
		'temporary' => TRUE
	);
	
	try {
		$result = newAccount($data,$conn);
		User::loginUser($result, TRUE, $conn);
		User::ifUserLoggedRedirect('game.php',$conn);
	}
	catch(Exception $ex) {
		die("Ocorreu um erro. Por favor tente novamente.");
	}

?>