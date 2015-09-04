$(function(){
	var n = 1;
	$(".jumbotron .content").slidesjs({
		width: 1024,
		height: 450,
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
	
	new SpriteAnimation($("#fairy")[0], 500, false, ["img/animations/fairy.png","img/character1.png"]);
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
