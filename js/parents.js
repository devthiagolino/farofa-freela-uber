function submitParentLogin() {

}

function newParentAccount() {
	$(".black-background .window").hide();
	
	
}

function rememberParentPassword() {
	
	$(".black-background .window").hide();
	
	var email = $(".remember-password-window #remember-email").val().trim();
	
	if(email == "") {
		//$(".remember-password-window span.error").text("Preencha seu email");
		$(".remember-password-window .error").text("Preencha seu email.");
		$(".remember-password-window").show();
		return;
	} 
	
	$(".remember-password-window .error").text("");
	$(".remember-password-window").hide();
	
	$.ajax({
		type:"POST",
		url:"ajax.php",
		data:{
			type:"rememberParentPassword",
			"email":email
		}
	}).done(function(msg){
		msg = JSON.parse(msg);
		if(msg.success) {
			$(".black-background").hide();
			showPopup("Recuperar senha","Enviamos um link no seu email para recuperar a sua senha.");
		}
		else {
			//$(".black-background").hide();
			//showPopup("Recuperar senha","Ocorreu um erro, por favor tente novamente.");
			$(".remember-password-window .error").text(msg.reason);
			$(".remember-password-window").show();
		}
	});
	
}

$(function(){

	$("input[type=image]").on("click",function(){
		$("input[required]").removeClass("validate").addClass("validate");
	});
	
	$(".remember-password-window .close, .new-parent-account-window .close").click(function(){
		$(".black-background").hide();
	});
	
	$(".remember-password-window .confirm").click(function(){
		//$(".black-background").hide();
		rememberParentPassword();
	});
	
	$("a.forgot").click(function(){
		$(".black-background .window").hide();
		$(".remember-password-window").show();
		$(".black-background").show();
		return false;
	});
	
	$("a.no-account").click(function(){
		/*showPopup("Ainda não é cadastrado?",
			"Para fazer seu cadastro, crie uma conta para uma criança " +
			"e coloque seu email durante a criação. Caso alguma criança já " + 
			"tenha usado seu email você pode clicar em 'Esqueceu sua senha?' para recuperá-la.");*/
		$(".black-background .window").hide();
		$(".new-parent-account-window").show();
		$(".black-background").show();
		return false;
	});
	
});

