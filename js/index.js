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

	$('.mobile-o-que-e > div').slick({
		dots: true
	});

    $('.character2, .character3, .character4').on('mouseover',function(){
        var s = $("audio.boy-sound").eq(Math.floor(Math.random()*3))[0];
        s.pause();
        s.currentTime = 0;
        s.play();
    });
    
    $('.character1').on('mouseover',function(){
        var s = $("audio.girl-sound").eq(Math.floor(Math.random()*3))[0];
        s.pause();
        s.currentTime = 0;
        s.play();
    });
    
    var guardFrames = [];
    var managerFrames = [];
    var nurseFrames = [];
    var professorFrames = [];
    
    for(var i = 1; i <= 65; ++i) {
		guardFrames.push("img/home_animations/characters/guard/guarda"+addLeadingZeros(i,4)+".png");
	}
	for(var i = 1; i <= 65; ++i) {
		managerFrames.push("img/home_animations/characters/manager/executivo"+addLeadingZeros(i,4)+".png");
	}
	for(var i = 1; i <= 65; ++i) {
		nurseFrames.push("img/home_animations/characters/nurse/enfermeira"+addLeadingZeros(i,4)+".png");
	}
	for(var i = 1; i <= 65; ++i) {
		professorFrames.push("img/home_animations/characters/professor/professor"+addLeadingZeros(i,4)+".png");
	}
	
	new SpriteAnimation($(".character2")[0], 20, false, managerFrames);
	new SpriteAnimation($(".character1")[0], 20, false, nurseFrames);
	new SpriteAnimation($(".character3")[0], 20, false, guardFrames);
	new SpriteAnimation($(".character4")[0], 20, false, professorFrames);
	
	var sphere1Frames = [];
	var sphere2Frames = [];
	var sphere3Frames = [];
	
	for(var i = 1; i <= 35; ++i) {
		sphere1Frames.push("img/home_animations/spheres/1/b1"+addLeadingZeros(i,4)+".png");
	}
	for(var i = 1; i <= 33; ++i) {
		sphere2Frames.push("img/home_animations/spheres/2/b2_v2"+addLeadingZeros(i,4)+".png");
	}
	for(var i = 1; i <= 85; ++i) {
		sphere3Frames.push("img/home_animations/spheres/3/b3"+addLeadingZeros(i,4)+".png");
	}
	
	new SpriteAnimation($(".about .about1")[0], 20, false, sphere1Frames, false, true);
	new SpriteAnimation($(".about .about2")[0], 20, false, sphere2Frames, false, true);
	new SpriteAnimation($(".about .about3")[0], 20, false, sphere3Frames, false, true);
	
	var securityFrames = [];
	
	for(var i = 1; i <= 90; ++i) {
		securityFrames.push("img/home_animations/safety/seguro"+addLeadingZeros(i,4)+".png");
	}
	
	new SpriteAnimation($(".safety-tag")[0], 20, false, securityFrames);
	
	var playFrames = [];
	for(var i = 1; i <= 55; ++i) {
		playFrames.push("img/home_animations/playbtn/jogar2"+addLeadingZeros(i,4)+".png");
	}
	//playFrames.unshift(playFrames[44]);
	/*for(var i = 45; i >= 1; --i) {
		playFrames.push("img/home_animations/playbtn/jogar"+addLeadingZeros(i,4)+".png");
	}*/
	new SpriteAnimation($(".play-btn canvas")[0], 20, false, playFrames,false,true);
});
