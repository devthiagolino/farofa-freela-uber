function addLeadingZeros (n, length)
{
    var str = (n > 0 ? n : -n) + "";
    var zeros = "";
    for (var i = length - str.length; i > 0; i--)
        zeros += "0";
    zeros += str;
    return n >= 0 ? zeros : "-" + zeros;
}

$(function(){
	var n = 1;
	$(".jumbotron .content").slidesjs({
		width: 1024,
		height: 400,
		callback: {
			start: function(number) {
				n = number;
			},
			complete: function(number) {
				$(".jumbotron").removeClass("active-slide"+n).addClass("active-slide"+number);
			}
		},
		navigation: {
			active: false
		}
	});
	
	//policial0001
	//fada0001
	
	var copFrames = [];
	var fairyFrames = [];
	var doctorFrames = [];
	var kidFrames = [];
	var gameFrames = [];
	var planeFrames = [];
	
	for(var i = 1; i <= 28; ++i) {
		fairyFrames.push("img/animations/fairy/fada"+addLeadingZeros(i,4)+".png");
	}
	
	for(var i = 1; i <= 80; ++i) {
		copFrames.push("img/animations/cop/policial"+addLeadingZeros(i,4)+".png");
	}
	
	for(var i = 1; i <= 92; ++i) {
		doctorFrames.push("img/animations/doctor/medico"+addLeadingZeros(i,4)+".png");
	}
	
	for(var i = 1; i <= 8; ++i) {
        kidFrames.push("img/animations/avatar/crianca"+i+".png");
    }
    
    for(var i = 1; i <= 6; ++i) {
        gameFrames.push("img/animations/games/"+i+".png");
    }
    
    for(var i = 1; i <= 48; ++i) {
		planeFrames.push("img/animations/plane/aviao"+addLeadingZeros(i,4)+".png");
	}
	
	new SpriteAnimation($("#plane")[0], 20, false, planeFrames);
	new SpriteAnimation($("#avatar")[0], 500, true, kidFrames);
	new SpriteAnimation($("#fairy")[0], 20, false, fairyFrames);
	new SpriteAnimation($("#cop")[0], 20, false, copFrames);
	new SpriteAnimation($("#doctor")[0], 20, false, doctorFrames);
	new SpriteAnimation($("#minigames")[0], 1000, true, gameFrames);
	new SpriteAnimation($("#buildings")[0], 1000, true, [
		"img/animations/buildings/casa04.png",
		"img/animations/buildings/casa05.png",
		"img/animations/buildings/casamalassombrada.png",
		"img/animations/buildings/circo.png",
		"img/animations/buildings/correios.png",
		"img/animations/buildings/cristo.png",
		"img/animations/buildings/detran.png",
		"img/animations/buildings/foguete.png",
		"img/animations/buildings/hotel.png",
		"img/animations/buildings/lojadetransporte.png",
		"img/animations/buildings/maracanã.png",
		"img/animations/buildings/mercado.png",
		"img/animations/buildings/planetario.png",
		"img/animations/buildings/policia.png",
		"img/animations/buildings/postodesaude.png",
		"img/animations/buildings/predio01.png",
		"img/animations/buildings/predio02.png",
		"img/animations/buildings/predio03.png",
		"img/animations/buildings/roupas.png",
		"img/animations/buildings/acessorios.png",
		"img/animations/buildings/bombeiros.png",
		"img/animations/buildings/cabelereiro.png",
		"img/animations/buildings/casa01.png",
		"img/animations/buildings/casa02.png",
		"img/animations/buildings/casa3.png"]);
});
