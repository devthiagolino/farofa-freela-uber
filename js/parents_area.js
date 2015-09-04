function openWindow(id) {
    $(".black-background").show();
    $(".black-background .window").hide();
    $(".black-background #"+id).show();
}

function closeWindow() {
    $(".black-background").hide();
    $(".black-background .window").hide();
}

function changeChildPassword(self) {
    $(".black-background").show();
    $("#change-password .hash").val(self.parent().attr('hash'));
    $("#change-password #isChild").val(1);
    $("#change-password > p span").html(self.parent().find(".screenname span").html());
    
    $("#change-password #password").val("");
    $("#change-password #password-confirmation").val("");
    $("#change-password #error-field").html("");
    
    $("#change-password input").removeClass("validate");
    $("#change-password .cop-speech").hide();
    $("#change-password .cop-speech#default-speech").show();
    $(".black-background #change-password").show();
    
    $(".black-background #change-password .confirm").off().on("click",function(){
        
        $(".black-background #change-password").hide();
        
        var password = $("#change-password #password").val();
        var passwordConfirmation = $("#change-password #password-confirmation").val();
        var hash =  $("#change-password .hash").val();
        var isChild =  $("#change-password #isChild").val();
        
        $.ajax({
           type:"POST",
           url:"ajax.php",
           data: {
               "type":"changePlayerPassword",
               "password":password,
               "password-confirmation":passwordConfirmation,
               "hash":hash,
               "isChild":isChild
           } 
        }).done(function(msg){
            msg = JSON.parse(msg);
            if(msg.success == true) {
                self.parent().attr('hash',msg.hash);
                $("#change-password .hash").val(msg.hash);
                $(".black-background").hide();
            }
            else {
                //console.log(msg.reason);
                $("#change-password .cop-speech").hide();
                $("#change-password input").removeClass("validate").addClass("validate");
                
                if(msg.errCode == 2) {
                	$("#change-password .cop-speech#length-speech").show();
                }
				else if(msg.errCode == 3) {
					$("#change-password .cop-speech#different-speech").show();
				}
				else {
					$("#change-password .cop-speech#default-speech").show();
					$("#change-password #error-field").html(msg.reason);
				}
                $(".black-background #change-password").show();
            }
        });
    });
}

function deleteCharacter(self) {
    $(".black-background").show();
    $("#delete-character-confirmation .hash").val(self.parent().attr('hash'));
    
    $(".black-background #delete-character-confirmation").show();
    
    $("#delete-character-confirmation .confirm").off().on("click",function(){
        
        $(".black-background #delete-character-confirmation").hide();
  
        var hash =  $("#delete-character-confirmation .hash").val();
        
        $.ajax({
           type:"POST",
           url:"ajax.php",
           data: {
               "type":"deleteCharacter",
               "hash":hash
           } 
        }).done(function(msg){
            console.log(msg);
            msg = JSON.parse(msg);
            console.log(msg);
            if(msg.success == true) {
                $(".black-background").hide();
                self.parent().remove();
            }
            else {
                $(".black-background").hide();
            }
        });
    });
}

function showCharacterStats(self) {
    $(".black-background").show();
    var hash = self.parent().attr('hash');
    //$("#history-window").show();
    
    $.ajax({
       type:"POST",
       url:"ajax.php",
       data: {
           "type":"characterStats",
           "hash":hash
       } 
    }).done(function(msg){
        console.log(msg);
        msg = JSON.parse(msg);
        console.log(msg);
        if(msg.success == true) {
            
            $("#history-window .screenname span").html(msg.nickname);
            $("#history-window .since").html("<span>Conta ativa desde: </span>"+msg.created_at);
            $("#history-window .last").html("<span>Último login: </span>"+msg.last_login);
            $("#history-window .total").html("<span>Tempo total dentro do URBZ: </span>"+msg.totalTimePlayed);
            $("#history-window .content").empty();
            for(var s in msg.sessions) {
                s = msg.sessions[s];
                $("#history-window .content").append(
                    "<tr>"+
                        "<td>"+s.loginAt+"</td>"+
                        "<td>"+s.sessionTime+"</td>"+
                        "<td>"+s.stores.join("<br>")+"</td>"+
                        "<td>"+s.minigames.join("<br>")+"</td>"+
                    "</tr>"
                );
            }
            
            $("#history-window").show();
        }
        else {
            $(".black-background").hide();
        }
    });
}

$(function(){
    
    $(".history-btn").on("click",function(){
        showCharacterStats($(this));
    });
    
    $(".change-pass-btn").on("click",function(){
        changeChildPassword($(this));
    });
    
    $(".child-card .delete").on("click",function(){
        deleteCharacter($(this));
    });
    
     $(".cancel, .cancel2").on("click",closeWindow);
    
});
