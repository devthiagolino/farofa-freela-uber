<?php

	function getBaseUrl() 
	{
		$currentPath = $_SERVER['PHP_SELF']; 
		$pathInfo = pathinfo($currentPath); 
		$hostName = $_SERVER['HTTP_HOST']; 
		$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"],0,5))=='https://'?'https://':'http://';
		return $protocol.$hostName.$pathInfo['dirname'];
	}
	
	function validatePost($post, $keys) {
		foreach($keys as $key)
			if(!isset($post[$key]))
				return FALSE;
		return TRUE;
	}
	
	function resendParentPasswordLink($email,$parentHash) {
		$to = $email;
		$subject = "Redefinir senha do Cantinho dos Pais";
		
		$message = 	file_get_contents('email/parent_forgot.html');
		$message = str_replace("{DOMAIN}", getBaseUrl(), $message);
		$message = str_replace("{PARENT_HASH}", $parentHash, $message);
		
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
		
		// More headers
		$headers .= 'From: nao-responda@urbz.com.br' . "\r\n";
		
		$mail_sent = mail($to,$subject,$message,$headers);
		
		return $mail_sent;
	}
	
	function resendChildPasswordLink($email,$login) { 
		$to = $email;
		$subject = "Redefinir senha de $login";
		
		$message = 	file_get_contents('email/child_forgot.html');
		$message = str_replace("{DOMAIN}", getBaseUrl(), $message);
		$message = str_replace("{LOGIN}", $login, $message);
		
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
		
		// More headers
		$headers .= 'From: nao-responda@urbz.com.br' . "\r\n";
		
		$mail_sent = mail($to,$subject,$message,$headers);
		
		return $mail_sent;
	}
	
	function sendParentEmail($email, $new_parent, $random_pass, $login, $screen_name) {
		$to = $email;
		$subject = "$login se cadastrou no Urbz!";
		
		$message = "";
		
		if($new_parent === TRUE) {
			$message = file_get_contents('email/new_parent.html');
			$message = str_replace("{LOGIN}", $login, $message);
			$message = str_replace("{PARENT_EMAIL}", $email, $message);
			$message = str_replace("{PARENT_PASSWORD}", $random_pass, $message);
			$message = str_replace("{DOMAIN}", getBaseUrl(), $message);
		}
		else {
			$message = file_get_contents('email/parent.html');
			$message = str_replace("{LOGIN}", $login, $message);
			$message = str_replace("{DOMAIN}", getBaseUrl(), $message);
		}
		
		// Always set content-type when sending HTML email
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
		
		// More headers
		$headers .= 'From: nao-responda@urbz.com.br' . "\r\n";
		
		$mail_sent = mail($to,$subject,$message,$headers);
		
		return $mail_sent;
	}
	
	function humanTiming ($time)
	{
		//date_default_timezone_set("America/Sao_Paulo");
		
	    $time = time() - $time; // to get the time since that moment
	
	    $tokens = array (
	        31536000 => 'ano',
	        2592000 => 'mês',
	        604800 => 'semana',
	        86400 => 'dia',
	        3600 => 'hora',
	        60 => 'minuto',
	        1 => 'segundo'
	    );
	
	    foreach ($tokens as $unit => $text) {
	        if ($time < $unit) continue;
	        $numberOfUnits = floor($time / $unit);
	        return $numberOfUnits.' '.$text.(($numberOfUnits>1)?'s':'');
	    }
	
	}
	
	function experienceToLevel($exp) 
	{
		return floor((-1.0+sqrt(1.0+8.0*($exp/100.0))) / 2.0) + 1;
	}
	
	function levelToExperience($level) 
	{
		$level -= 1;
		return (100*$level*($level+1))/2;
	}
	
	function newAccount($data, $conn) {
		if(validatePost($data, array('name', 'gender', 'age', 'parent-email', 'password', 'password-confirmation')) === FALSE)
			throw new Exception("error");//die("error");
		
		$temporary = (isset($data['temporary']) && $data['temporary'] === "1");
		$parent_email = $data['parent-email'];
		
		if(!filter_var($parent_email, FILTER_VALIDATE_EMAIL)) {
			throw new Exception("Email do responsável inválido.");
		}
		
		$parent_id = -1;
		
		$conn->query('START TRANSACTION');
		
		$parent_result = $conn->prepare('SELECT id FROM parent WHERE email = ?');
		$parent_result->bind_param('s', $parent_email);
		$parent_id = -1;
		$new_parent = FALSE;
		$random_parent_pass = NULL;
		if($parent_result->execute()) {
			$res = $parent_result->get_result();
			$count = 0;
			while($row = $res->fetch_assoc()) {
				$count++;
				$parent_id = $row['id'];
			}
			if($count == 0) {
				
				$random_parent_pass = bin2hex(openssl_random_pseudo_bytes(4));
				$parent_salt = "".bin2hex(mcrypt_create_iv(32));
				$parent_password_hash = hash('sha256', $random_parent_pass.$parent_salt);
				$parent_user_hash = hash('sha256', $parent_email.$random_parent_pass.$parent_salt);
				
				$parent_result = $conn->prepare('INSERT INTO parent VALUE (?,?,?,?,?)');
				$parent_result->bind_param('issss', $id = 0, $parent_email, $parent_password_hash, $parent_salt, $parent_user_hash);
				$new_parent = TRUE;
				if($parent_result->execute()) {
					$parent_id = $parent_result->insert_id;
				}
				else {
					$conn->query('ROLLBACK');
					throw new Exception("Não foi possível concluir seu cadastro, por favor tente novamente.");
				}
			}
		}
		else {
			$conn->query('ROLLBACK');
			throw new Exception("Não foi possível concluir seu cadastro, por favor tente novamente.");
		}
		
		$children_count = $conn->query("SELECT count(id) as count FROM player WHERE parent_id = $parent_id");
		if($children_count->fetch_assoc()['count'] >= 4) {
			throw new Exception("O número máximo contas associadas ao email '$parent_email' já foi atingido. O máximo de contas que um pai ou responsável pode ter associadas a um email é 4.");
		}

		$password = $data['password'];
		$password_confirmation = $data['password-confirmation'];
		
		if(strlen($password) < 6) {
			throw new Exception("A senha precisa ter no mínimo 6 caracteres.");
		}

		if($password !== $password_confirmation) {
			throw new Exception("A senha e a confirmação da senha precisam ser iguais.");
		}

		$login = $data['name'];
		
		if(strlen($login) < 3 || strlen($login) > 64) {
			throw new Exception("O seu nome completo deve ter no mínimo 3 caracteres e no máximo 64.");
		}
		$age = $data['age'];
		
		if(is_numeric($age) === FALSE || ctype_digit(strval($age)) == FALSE || $age < 0 || $age > 120) {
			throw new Exception("A idade que foi digitada não é válida.");
		}
		
		$gender = $data['gender'];
		
		$salt = "".bin2hex(mcrypt_create_iv(32));
		$password_hash = hash('sha256', $password.$salt);
		$user_hash = hash('sha256', $login.$password.$salt);
																									
		$player_result = $conn->prepare('INSERT INTO player VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),NOW(),?,0)');
		$player_result->bind_param(
			'iiisssssiiiiiii',
			$id = 0,$parent_id,$gender,$login,$password_hash,
			$salt,$user_hash,$screen_name = "",$avatar_id = 1,$age,
			$experience = 0,$money = 0,$first_login = 1,$moderator = 0,$temp = ($temporary ?  1 : 0));
		
		if($player_result->execute()) {
			$conn->query('COMMIT');
			if($temporary !== TRUE){		
				sendParentEmail($parent_email, $new_parent, $random_parent_pass, $login, $screen_name);
			} 
			
			return "$user_hash";
		}
		else {
			$conn->query('ROLLBACK');
			if($temporary === FALSE) {
				if($player_result->errno == 1062) {
					throw new Exception("O seu nome completo já está sendo usado por outro usuário dentro da conta '".$parent_email."'. Talvez seu pai ou responsável já tenha criado uma conta para você? Se não, tente um nome diferente.");
				}
				die($player_result->errno . " - " . $player_result->error);
			} 
			throw new Exception("error");
		}
	}

?>








