$(function(){
	
	$(".player input[type=radio]").on("change",function(){
		$(".initially-hidden").show();
	});
	
	$("p.forgot").on("click",function(){
		
		var email = $("input[name=parent-email]").val();
		var childId = $("input[type=radio]:checked").attr("id");
		
		if(!childId) {
			return showPopup("Recuperar senha","Selecione um jogador para recuperar a senha.");
		}
		
		showPopup("Recuperar senha","Enviamos um link no email do seu pai ou responsável. Peça para ele seguir as instruções no email de como criar uma nova senha para você.");
		
		$.ajax({
		type:"POST",
		url:"ajax.php",
		data:{
			type:"rememberChildPassword",
			"email":email,
			"childId":childId
		}
		}).done(function(msg){
			console.log(msg);
			msg = JSON.parse(msg);
			if(!msg.success) {
				showPopup("Recuperar senha","Ocorreu um erro, por favor tente novamente.");
			}
		});
		
	});
	
});
