<?php

	class PlayerSession {
		public $loginAt = null;
		public $sessionTime = 0;
		public $stores = array();
		public $minigames = array();
	}

	class PlayerStats {
		public $nickname = "";
		public $experience = 0;
		public $level = 0;
		public $money = 0;
		public $last_login = null;
		public $created_at = null;
		public $totalTimePlayed = 0;
		public $sessions = array();
		/*public $totalTimeInCity = 0;
		public $totalTimeInPublicAreas = 0;
		public $totalTimeInMiniGames = 0;
		public $timePerPublicArea = array();
		public $timePerMiniGame = array();*/
		public $success = true;
	}
	
	function seconds_to_time($sec) {
		$H = floor($sec/3600);
		$i = ($sec / 60) % 60;
		$s = $sec % 60;
		return sprintf("%02dh%02dmin", $H, $i);
	}
	
	function seconds_to_time_longer($sec) {
		$H = floor($sec/3600);
		$i = ($sec / 60) % 60;
		$s = $sec % 60;
		
		if($i > 0 && $H == 0)
			return sprintf("%02d minutos", $i);
		if($H > 0 && $i == 0)
			return sprintf("%02d horas", $H);
		if($H > 0 && $i > 0)
			return sprintf("%02d horas e %02d minutos", $H, $i);
		return sprintf("%02d segundos", $s);
	}
	 
	function calculate_player_stats($player_id,$conn) {
		$ret = new PlayerStats;
		
		$result = $conn->prepare('SELECT * FROM player WHERE id=?');
		$result->bind_param('i',$player_id);
		$result->execute();
		$res = $result->get_result();
		
		if($res->num_rows == 0) {
			return $ret;
		}
		
		$player = $res->fetch_assoc();
		$ret->nickname = $player['screen_name'];
		$ret->experience = $player['experience'];
		$ret->level = floor((-1.0 + sqrt(1.0 + 8.0 * ($ret->experience / 100.0))) / 2.0) + 1.0;
		$ret->money = $player['money'];
		$ret->last_login = new DateTime($player['last_login']);
		$ret->created_at = new DateTime($player['created_at']);
		
		//setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
		setlocale(LC_ALL, "pt_BR", "pt_BR.iso-8859-1", "pt_BR.utf-8", "portuguese");
		$ret->last_login = (strftime('%d de %B de %Y',$ret->last_login->getTimeStamp()));
		$ret->created_at = (strftime('%d de %B de %Y',$ret->created_at->getTimeStamp()));
		
		$result = $conn->prepare('SELECT * FROM analytic_data WHERE player_id=? ORDER BY date ASC');
		$result->bind_param('i',$player_id);
		$result->execute();
		$res = $result->get_result();
		
		if($res->num_rows == 0) {
			return $ret;
		}
		
		$session = new PlayerSession();
		
		$games = array('','No Trilho do Trem','Em Cima da Faixa','Obstákulos','Batalha dos Mitos','Mordix','Em Apuros');
		
		while ($row = $res->fetch_assoc()) {
			
			if($row['type'] == "login") {
				$session->loginAt = new DateTime($row['date']);
			}
			if($row['type'] == "gameStart") {
				if(array_search($games[$row['data']], $session->minigames) === FALSE)
					array_push($session->minigames,$games[$row['data']]);
			}
			if($row['type'] == "logout" && $session->loginAt != null) {
				$logoutAt = new DateTime($row['date']);
				$session->sessionTime = $logoutAt->getTimestamp() - $session->loginAt->getTimestamp();
				
				array_push($ret->sessions, $session);
				$session->loginAt = strftime('%A, %d/%b/%Y <br>Horário: %Hh%I',$session->loginAt->getTimeStamp());
				$session = new PlayerSession();
			}
				
		}
		
		$ret->sessions = array_reverse($ret->sessions);
		
		foreach($ret->sessions as $s) {
			$ret->totalTimePlayed += $s->sessionTime;
			$s->sessionTime = seconds_to_time_longer($s->sessionTime);
		}
		$ret->totalTimePlayed = seconds_to_time($ret->totalTimePlayed);
		
		return $ret;
		/*$last_login = null;
		$last_public_area_enter = null;
		$last_public_area_enter_id = 0;
		$last_game_enter = null;
		$last_game_enter_id = null;
		$total_time_played = 0;
		$total_time_public_areas = 0;
		$total_time_in_games = 0;
		
		$timePerPublicArea = array();
		$timePerGame = array();
		
		while ($row = $res->fetch_assoc()) {
			
			if($row['type'] == "login")
				$last_login = new DateTime($row['date']);
			
			if($row['type'] == "publicAreaEnter") {
				$last_public_area_enter = new DateTime($row['date']);
				$last_public_area_enter_id = $row['data'];
			}
	
			if($row['type'] == "gameStart") {
				$last_game_enter = new DateTime($row['date']);
				$last_game_enter_id = $row['data'];
			}
			
			if($row['type'] == "logout") {
				if($last_login != null) {
					$total_time_played += ($last_login->diff(new DateTime($row['date']))->s);
					$last_login = null;
				}
				if($last_public_area_enter != null) {
					$total_time_public_areas += ($last_public_area_enter->diff(new DateTime($row['date']))->s);
					
					if(isset($timePerPublicArea[$last_public_area_enter_id])) {
						$timePerPublicArea[$last_public_area_enter_id] += ($last_public_area_enter->diff(new DateTime($row['date']))->s);
					}
					else {
						$timePerPublicArea[$last_public_area_enter_id] = ($last_public_area_enter->diff(new DateTime($row['date']))->s);
					}
					
					$last_public_area_enter = null;
				}
				if($last_game_enter != null) {
					$total_time_in_games += ($last_game_enter->diff(new DateTime($row['date']))->s);
					
					if(isset($timePerGame[$last_game_enter_id])) {
						$timePerGame[$last_game_enter_id] += ($last_game_enter->diff(new DateTime($row['date']))->s);
					}
					else {
						$timePerGame[$last_game_enter_id] = ($last_game_enter->diff(new DateTime($row['date']))->s);
					}
					
					$last_game_enter = null;
				}
			}
			if($row['type'] == "publicAreaLeave" && $last_public_area_enter != null) {
				$total_time_public_areas += ($last_public_area_enter->diff(new DateTime($row['date']))->s);
					
				if(isset($timePerPublicArea[$last_public_area_enter_id])) {
					$timePerPublicArea[$last_public_area_enter_id] += ($last_public_area_enter->diff(new DateTime($row['date']))->s);
				}
				else {
					$timePerPublicArea[$last_public_area_enter_id] = ($last_public_area_enter->diff(new DateTime($row['date']))->s);
				}
				
				$last_public_area_enter = null;
			}
			if($row['type'] == "gameEnd" && $last_game_enter != null) {
				$total_time_in_games += ($last_game_enter->diff(new DateTime($row['date']))->s);
				
				if(isset($timePerGame[$last_game_enter_id])) {
					$timePerGame[$last_game_enter_id] += ($last_game_enter->diff(new DateTime($row['date']))->s);
				}
				else {
					$timePerGame[$last_game_enter_id] = ($last_game_enter->diff(new DateTime($row['date']))->s);
				}
				
				$last_game_enter = null;
			}
		}
	
		$ret->totalTimePlayed = seconds_to_time($total_time_played);
		$ret->totalTimeInPublicAreas = seconds_to_time($total_time_public_areas);
		$ret->totalTimeInMiniGames = seconds_to_time($total_time_in_games);
		$ret->totalTimeInCity = seconds_to_time($ret->totalTimePlayed - ($ret->totalTimeInPublicAreas + $ret->totalTimeInMiniGames));
		$ret->timePerPublicArea = $timePerPublicArea;
		$ret->timePerMiniGame = $timePerGame;
		
		return $ret;*/
	}
	
?>