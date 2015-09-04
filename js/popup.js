$(function(){
	$("body").on("click",".popup .close",function(){
		$(".popup-background").hide();
	});	
});

function showPopup(title, message) {
	$(".popup .title").text(title);
	$(".popup .content span").text(message);
	$(".popup-background").show();
}
