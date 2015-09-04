function isInt(value) {
  return !isNaN(value) && (function(x) { return (x | 0) === x; })(parseFloat(value));
}

function isEmail(value) {
    var re = /\S+@\S+\.\S+/;
    return re.test(value);
}

function validatePassword() {
    if($('input#password').val().length < 6)
        return false;
    if($('input#password').val() != $('input#password-confirmation').val())
        return false;
    return true;
}

$(function(){
    $("#content form").slidesjs({
        width: 1024,
        height: 450,
        navigation: {
            active: false
        },
        pagination: {
            active: true
        }
    });
    
    $(".slidesjs-next, .end-button").hide();
    
    $("input#name").on("keyup change",function(e){
        if($("input#name").val().length >= 3 && $("input#name").val().length <= 64) {
            $("input#name").parent().find(".slidesjs-next").show();
            $(".min-3-characters").hide();
        } 
        else {
            $("input#name").parent().find(".slidesjs-next").hide();
            $(".min-3-characters").show();
        }
    });
    $("input#name").keyup();
    
    $("input[name=gender]").on('change',function(){
        $("input[name=gender]:checked").parent().find(".slidesjs-next").show();
    });
	$("input[name=gender]").change();

    $("input#age").on("change",function(e){
        if($("input#age").val() == "") {
            $("input#age").parent().find(".slidesjs-next").hide();
        }
    });
    
    $("input#age").on("keyup change",function(e){
        if($("input#age").val() == "") {
            $("input#age").parent().find(".slidesjs-next").hide();
        }
        if(isInt($("input#age").val()) && parseInt($("input#age").val()) > 0 && parseInt($("input#age").val()) < 120) {
            $("input#age").parent().find(".slidesjs-next").show();
        }
        else {
            $("input#age").parent().find(".slidesjs-next").hide();
        }
    });
    $("input#age").change();
    
    $("input#parent-email").on("keyup change",function(e){
        if($("input#parent-email").val() == "") {
            $("input#parent-email").parent().find(".slidesjs-next").hide();
        }
        if(isEmail($("input#parent-email").val())) {
            $("input#parent-email").parent().find(".slidesjs-next").show();
        }
    });
    $("input#parent-email").keyup();
    
    $("input#password, input#password-confirmation").on("keyup change",function(e){
        /*if($("input#password").val() == "" || $("input#password-confirmation").val() == "") {
            $("input#password").parent().find(".end-button").hide();
            $(".min-6-characters").show();
            $(".equal-passwords").hide();
            return;
        }
        else*/if($("input#password").val().length < 6) {
            $("input#password").parent().find(".end-button").hide();
            $(".min-6-characters").show();
            $(".equal-passwords").hide();
            return;
        }
        else if($("input#password").val() != $("input#password-confirmation").val()) {
            $("input#password").parent().find(".end-button").hide();
            $(".min-6-characters").hide();
            $(".equal-passwords").show();
            return;
        }
        $(".min-6-characters").hide();
        $(".equal-passwords").hide();
        $("input#password").parent().find(".end-button").show();
    });
    $("input#password, input#password-confirmation").keyup();
    
    $('form').on("keyup keypress", function(e) {
		var code = e.keyCode || e.which; 
		if (code  == 13) {               
			e.preventDefault();
			return false;
		}
	});
    
});
