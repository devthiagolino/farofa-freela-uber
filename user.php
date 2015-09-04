<?php

	class User {
		private $userHash = '';
		private $temporary = false;
		private $screen_name = '';
		private $avatarUrl = '';
		private $parent = false;
		private $id = -1;
		
		public function __construct($userHash, $temporary, $screenName, $avatarUrl, $id) {
			$this->userHash = $userHash;
			$this->temporary = $temporary;
			$this->screen_name = $screenName;
			$this->avatarUrl = $avatarUrl;
			$this->id = $id;
		}
		
		public function getAvatarUrl() {
			return $this->avatarUrl;
		}
		
		public function getUserHash() {
			return $this->userHash;
		}
		
		public function setUserHash($hash) {
			$this->userHash = $hash;
		}
		
		public function isTemporary() {
			return $this->temporary;
		}
		
		public function getScreenName() {
			return $this->screen_name;
		}
		
		public function isParent() {
			return $this->parent;
		}
		
		public function getId() {
			return $this->id;
		}
		
		public function updateData($conn) {
			if(!$this->isParent()) {
				User::safeSessionStart();
			
				$result = $conn->prepare('SELECT p.screen_name, pi.url, p.id FROM player as p, player_icon as pi WHERE p.user_hash=? AND pi.id = p.player_icon_id');
				$result->bind_param('s',$this->getUserHash());
				$result->execute();
				$res = $result->get_result();
				
				if($res->num_rows == 0) {
					die("Usuario invalido com a hash ".$this->getUserHash());
				}
				
				$user_info = $res->fetch_assoc();
				
				$this->screen_name = $user_info['screen_name'];
				$this->avatarUrl = $user_info['url'];
			}
		}
		
		private static function safeSessionStart() {
			if(session_status() == PHP_SESSION_NONE) session_start();
		}
		
		public static function loginParent($userHash, $conn) {
			if(User::isAnyLogged($conn))
				User::logout($conn);
			
			User::safeSessionStart();
			
			$result = $conn->prepare('SELECT p.email, p.id FROM parent as p WHERE p.user_hash=?');
			$result->bind_param('s',$userHash);
			$result->execute();
			$res = $result->get_result();
			
			$user_info = $res->fetch_assoc();
			
			$_SESSION['user'] = new User($userHash, FALSE, $user_info['email'], 'img/parent_avatar.png', $user_info['id']);
			$_SESSION['user']->parent = TRUE;
			
			return $_SESSION['user'];
		}
		
		public static function loginUser($userHash, $temporary, $conn) {
			if(User::isAnyLogged($conn))
				User::logout($conn);
			
			User::safeSessionStart();
			
			$result = $conn->prepare('SELECT p.screen_name, pi.url, p.id FROM player as p, player_icon as pi WHERE p.user_hash=? AND pi.id = p.player_icon_id');
			$result->bind_param('s',$userHash);
			$result->execute();
			$res = $result->get_result();
			
			if($res->num_rows == 0) {
				die("Usuario invalido com a hash ".$userHash);
			}
			
			$user_info = $res->fetch_assoc();
			
			$_SESSION['user'] = new User($userHash, $temporary, $user_info['screen_name'], $user_info['url'], $user_info['id']);
			
			setcookie('userHash',$userHash);
			setcookie('temporary',$temporary ? '1' : '0' );
			
			return $_SESSION['user'];
		}
		
		public static function logout($conn) {
			User::safeSessionStart();
			
			/*if($_SESSION['user']->isTemporary() && $conn != NULL) {
				$deletion = $conn->prepare('DELETE FROM player WHERE user_hash = ?');
				$deletion->bind_param('s',$_SESSION['user']->getUserHash());
				$deletion->execute();
			}*/
			
			setcookie('userHash','',time()-3600);
			setcookie('temporary','',time()-3600);
			unset($_COOKIE['userHash']);
			unset($_COOKIE['temporary']);
			
			session_unset();
			session_destroy();
		}

		public static function isParentLogged($conn) {
			User::safeSessionStart();
			
			if(isset($_SESSION['user'])) {
				if($_SESSION['user']->isParent() == TRUE) return $_SESSION['user'];
			}
			
			return FALSE;
		}
		
		public static function isUserLogged($conn) {
			User::safeSessionStart();
			
			if(isset($_SESSION['user'])) {
				if($_SESSION['user']->isParent() == TRUE) return FALSE;
				return $_SESSION['user'];
			}
			
			/*if(isset($_COOKIE['userHash'])) {
				return User::loginUser($_COOKIE['userHash'],(isset($_COOKIE['temporary']) && $_COOKIE['temporary'] == "1"),$conn);
			}*/
			
			return FALSE;
		}
		
		public static function isAnyLogged($conn) {
			User::safeSessionStart();
			
			return User::isUserLogged($conn) || User::isParentLogged($conn);
		}
		 
		 
		public static function getUser() {
			User::safeSessionStart();
			
			return $_SESSION['user'];
		}
		
		public static function ifUserLoggedRedirect($page, $conn) {
			if(User::isUserLogged($conn)) {
				header("location: $page");
				die();
			}
		}
		
		public static function ifParentLoggedRedirect($page, $conn) {
			if(User::isParentLogged($conn)) {
				header("location: $page");
				die();
			}
		}
		
		public static function ifAnyLoggedRedirect($page,$conn) {
			if(User::isAnyLogged($conn)) {
				header("location: $page");
				die();
			}
		}
		
	}

?>