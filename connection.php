<?php
	$conn = new mysqli('localhost', 'root', '', 'bradesco');
	
	// Check connection
	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
	$conn->query('SET CHARACTER SET utf8');
?>