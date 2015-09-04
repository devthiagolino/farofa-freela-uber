$(function(){
	$("#submit-contact").on("click",function(){
		$("input[type=text], textarea").removeClass("validate").addClass("validate");
	});
});
