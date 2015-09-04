<?php	
	define ('SITE_ROOT', realpath(dirname(__FILE__)));
	define ('UPLOAD_PATH', SITE_ROOT.'/uploads/');
	
	include_once('connection.php');
	
	function fixSymbols($str) {
		return iconv('utf-8','iso-8859-1',$str);
	}
	
	function moveAndRename($file, $type) {
		$fileName = fixSymbols($file['name']); 
		$fileTmpLoc = $file['tmp_name'];
		
		$pathAndName = tempnam(UPLOAD_PATH, "$type-");
		unlink($pathAndName);
		
		$moveResult = move_uploaded_file($fileTmpLoc, $pathAndName);
		
		if($moveResult == false) {
			die('Não foi possível mover o arquivo, cancelando operação!');
		}
		
		return basename($pathAndName);
	}
	
	function _m($str) { return ($str); }
	
	function executeOrDie($insertion, $file_name) {
		global $conn;
		if(!$insertion->execute()) {
			if($file_name != NULL)
				unlink(UPLOAD_PATH.$file_name);
        	die("Não foi possível registrar o arquivo no banco de dados! Erro SQL: ".$conn->error);
		}
	}
	
	$type = $_POST['request_type'];
	$types = array('headpiece','hair',
	'facial_feature','cloth','accessory','skin','building','item','citizen','animation','emoticon',
	'car','fixed_npc','costume','gift_card','world_item','nose','building_type','building_model',
	'building_texture','player_icon','store');
	
	$conn->query('SET CHARACTER SET iso-8859-1');
	
	if(in_array($type,$types) === true) {
		if($type == 'headpiece') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO headpiece VALUES (0,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssisssiii',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),
				_m($_POST['icon_name']),_m($_POST['description']),$_POST['price'],$_POST['unlock_level'],$_POST['hides_hair']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'hair') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO hair VALUES (0,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssisssii',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),
				_m($_POST['icon_name']),_m($_POST['description']),$_POST['price'],$_POST['unlock_level']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'facial_feature') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO facial_feature VALUES (0,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssissss',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['texture_name']),_m($_POST['icon_name']),
				_m($_POST['description']),$_POST['facial_feature_type']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'cloth') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO cloth VALUES (0,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssisssiis',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['texture_name']),_m($_POST['icon_name']),
				_m($_POST['description']),$_POST['price'],$_POST['unlock_level'],$_POST['cloth_type']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'accessory') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO accessory VALUES (0,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssisssiis',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),_m($_POST['icon_name']),
				_m($_POST['description']),$_POST['price'],$_POST['unlock_level'],$_POST['accessory_type']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'skin') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO skin VALUES (0,?,?,?,?,?,?)');
			$insertion->bind_param('ssisss',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['texture_name']),_m($_POST['icon_name']),
				_m($_POST['description'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'item') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO item VALUES (0,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('sssisssii',
				$_POST['item_type'],_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),_m($_POST['icon_name']),
				_m($_POST['description']),$_POST['price'],$_POST['unlock_level']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'citizen') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO citizen VALUES (0,?,?,?,?,?)');
			$insertion->bind_param('sisss',
				_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),$_POST['citizen_type'],
				_m($_POST['name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'animation') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO animation VALUES (0,?,?,?,?,?,?)');
			$insertion->bind_param('ssisss',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['animation_name']),_m($_POST['icon_name']),_m($_POST['description'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'emoticon') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO emoticon VALUES (0,?,?,?,?,?,?)');
			$insertion->bind_param('ssisss',
				_m($_POST['name']),_m($file_name),$_POST['bundle_version'],_m($_POST['texture_name']),_m($_POST['icon_name']),_m($_POST['description'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'car') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO car VALUES (0,?,?,?,?)');
			$insertion->bind_param('siss',
				_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),_m($_POST['car_type'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'fixed_npc') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO fixed_npc VALUES (0,?,?,?,?,?,?,?)');
			$insertion->bind_param('sisssss',
				_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),_m($_POST['portrait_name']),_m($_POST['name']),
				_m($_POST['default_text']),strlen($_POST['background_name']) == 0 ? NULL : _m($_POST['background_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'costume') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO costume VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssiisiiiiiiiis',_m($_POST['name']),_m($_POST['description']),$_POST['price'],$_POST['unlock_level'],
				_m($file_name),$_POST['bundle_version'],$_POST['headpiece_id'],$_POST['hair_id'],$_POST['upperbody_id'],$_POST['lowerbody_id'],
				$_POST['feet_id'],$_POST['hand_accessory_id'],$_POST['body_accessory_id'],$_POST['icon_name']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'gift_card') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO gift_card VALUES (0,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('sssissii',_m($_POST['name']),_m($_POST['description']),
				_m($file_name),$_POST['bundle_version'],_m($_POST['texture_name']),_m($_POST['icon_name']),$_POST['price'],$_POST['unlock_level']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'world_item') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO world_item VALUES (0,?,?,?,?,?)');
			$insertion->bind_param('sssis',_m($_POST['name']),_m($_POST['description']),
				_m($file_name),$_POST['bundle_version'],_m($_POST['model_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'nose') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO nose VALUES (0,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssisssiii',_m($_POST['name']),
				_m($file_name),$_POST['bundle_version'],_m($_POST['model_name']),_m($_POST['icon_name']),_m($_POST['description']),$_POST['price'],$_POST['unlock_level'],$_POST['uses_skin']
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'building_type') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO building_type VALUES (0,?,?,?,?,?)');
			$insertion->bind_param('sssis',_m($_POST['name']),_m($_POST['description']),
				_m($file_name),$_POST['bundle_version'],_m($_POST['icon_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'building') {
			$insertion = $conn->prepare('INSERT INTO building VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
			$insertion->bind_param('ssiiiiiiiiiiiiiiiisis',
			_m($_POST['name']),
			_m($_POST['description']),
			$_POST['building_type_id'],
			$_POST['price'],
			$_POST['experience_bonus'],
			$_POST['width'],
			$_POST['length'],
			$_POST['unlock_level'],
			$_POST['starter'],
			$_POST['upgrade_id'] == -1 ? NULL : $_POST['upgrade_id'],
			$_POST['population_bonus'],
			$_POST['population_requirement'],
			$_POST['money_bonus'],
			$_POST['money_rate'],
			$_POST['special_id'],
			$_POST['construction_time'],
			$_POST['game_id'] == -1 ? NULL : $_POST['game_id'],
			$_POST['public_area_id'] == -1 ? NULL : $_POST['public_area_id'],
			$_POST['citizen_type'] == "" ? NULL : $_POST['citizen_type'],
			$_POST['fixed_npc_id'] == -1 ? NULL : $_POST['fixed_npc_id'],
			$_POST['car_type'] == "" ? NULL : $_POST['car_type']
			);
			executeOrDie($insertion,NULL);
		}
		else if($type == 'building_model') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO building_model VALUES (0,?,?,?,?)');
			$insertion->bind_param('isis',
			$_POST['building_id'],
			_m($file_name),
			$_POST['bundle_version'],
			_m($_POST['model_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'building_texture') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO building_model_texture VALUES (0,?,?,?,?,?)');
			$insertion->bind_param('isiss',
			$_POST['building_model_id'],
			_m($file_name),
			$_POST['bundle_version'],
			_m($_POST['texture_name']),
			_m($_POST['icon_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'player_icon') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$url = $file_name.".png";
			$moved_icon = move_uploaded_file($_FILES['icon']['tmp_name'], UPLOAD_PATH.$url);
			
			if(!$moved_icon) {
				echo "Error moving png file";
				unlink(UPLOAD_PATH.$file_name);
				die();
			}
			
			$insertion = $conn->prepare('INSERT INTO player_icon VALUES (0,?,?,?,?)');
			$insertion->bind_param('ssis',
			_m($url),
			_m($file_name),
			$_POST['bundle_version'],
			_m($_POST['icon_name'])
			);
			executeOrDie($insertion,$file_name);
		}
		else if($type == 'store') {
			$file_name = moveAndRename($_FILES["file"],$type);
			
			$insertion = $conn->prepare('INSERT INTO store VALUES (0,?,?,?,?,?)');
			$insertion->bind_param('sssis',
			_m($_POST['name']),
			_m($_POST['description']),
			_m($file_name),
			$_POST['bundle_version'],
			_m($_POST['background_name'])
			);
			executeOrDie($insertion,$file_name);
		}
	}
	else {
		die('Wrong request_type: '.$_POST['request_type']);
	}
?>