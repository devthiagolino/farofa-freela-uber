<?php
include("connection.php");
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title> </title>
	</head>
	<body>

<?php

/*
Informações do usuário
Nickname
Experiência
Moedas

** Sistema para mudar a senha

Informações conta
- Desde quando criou a conta;
- Último login
- Quanto tempo (total) que passa dentro do Mundo Virtual

Histórico
- Dias/ hora/ Atividade (Quests e Jogos)- sub tempo de cada atividade / Total de tempo do dia

Ranking atividades mais acessadas
 */

class PlayerStats {
	public $nickname = "";
	public $experience = 0;
	public $level = 0;
	public $money = 0;
	public $last_login = null;
	public $created_at = null;
	public $totalTimePlayed = 0;
	public $totalTimeInCity = 0;
	public $totalTimeInPublicAreas = 0;
	public $totalTimeInMiniGames = 0;
	public $timePerPublicArea = array();
	public $timePerMiniGame = array();
}

function seconds_to_time($sec) {
	$H = floor($sec/3600);
	$i = ($sec / 60) % 60;
	$s = $sec % 60;
	return sprintf("%02d:%02d:%02d", $H, $i, $s);
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
	
	$result = $conn->prepare('SELECT * FROM analytic_data WHERE player_id=?');
	$result->bind_param('i',$player_id);
	$result->execute();
	$res = $result->get_result();
	
	if($res->num_rows == 0) {
		return $ret;
	}
	
	$last_login = null;
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

	$ret->totalTimePlayed = $total_time_played;
	$ret->totalTimeInPublicAreas = $total_time_public_areas;
	$ret->totalTimeInMiniGames = $total_time_in_games;
	$ret->totalTimeInCity = $ret->totalTimePlayed - ($ret->totalTimeInPublicAreas + $ret->totalTimeInMiniGames);
	$ret->timePerPublicArea = $timePerPublicArea;
	$ret->timePerMiniGame = $timePerGame;
	
	return $ret;
}
 
if(!isset($_GET["id"]))
	die('ID não encontrado.');

$player = calculate_player_stats($_GET['id'],$conn);

$player_id = $_GET["id"];

echo "Nickname: ".$player->nickname."<br>";
echo "Experiência: ".$player->experience."<br>";
echo "Nível: " .$player->level."<br>";
echo "Dinheiro: ".$player->money."<br>";

echo "Último Login: ".$player->last_login->format("Y-m-d H:i:s")."<br>";
echo "Conta criada em: ".$player->created_at->format("Y-m-d H:i:s")."<br>";

echo "Tempo total de jogo: ".seconds_to_time($player->totalTimePlayed)."<br>";
echo "Tempo total de jogo em áreas online: ".seconds_to_time($player->totalTimeInPublicAreas)."<br>";
echo "Tempo total em mini-jogos: ".seconds_to_time($player->totalTimeInMiniGames)."<br>";
echo "Tempo total na cidade: ".seconds_to_time($player->totalTimeInCity)."<br>";

echo "Total por área online: <br>";
foreach($player->timePerPublicArea as $key => $value) {
	echo "Área $key: ".seconds_to_time($value)."<br>";
}

echo "Total por jogo: <br>";
foreach($player->timePerMiniGame as $key => $value) {
	echo "Área $key: ".seconds_to_time($value)."<br>";
}

$result = $conn->prepare('SELECT id FROM player');
$result->execute();
$res = $result->get_result();

$totalTime = 0;
$totalOnlineTime = 0;
$totalMiniGameTime = 0;

while($row = $res->fetch_assoc()) {
	$player = calculate_player_stats($row['id'], $conn);
	$totalTime += $player->totalTimePlayed;
	$totalOnlineTime += $player->totalTimeInPublicAreas;
	$totalMiniGameTime += $player->totalTimeInMiniGames;
}

echo "<br><br><strong>Analytics do Jogo:</strong>";

echo "<br>Soma de tempo dos jogadores: ".seconds_to_time($totalTime);
echo "<br>Soma de tempo dos jogadores na área online: ".seconds_to_time($totalOnlineTime);
echo "<br>Soma de tempo dos jogadores em minijogos: ".seconds_to_time($totalMiniGameTime);

?>
		
	</body>
</html>
