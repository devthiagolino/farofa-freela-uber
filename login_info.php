<?php
	include('user.php');
	include('connection.php');
	include('common.php');

	if(/*$_SERVER['REQUEST_METHOD'] === 'POST' &&*/ User::isUserLogged($conn)) {
		die("Conectado.".User::getUser()->getUserHash());
	}

?>