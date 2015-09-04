function unique(value, index, self) {
	return self.indexOf(value) === index;
}

regExpEscape = function(s) {
	console.log("escaping: "+s);
    return s.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
};

$(function(){

	var toogleMenu 	= $('span.up-down-toogle');
	var navMobile 	= $('.mobile');
	var active = false;
	toogleMenu.bind('click', function(){		
		if(active == false){
			navMobile.animate({'height': 300 + 'px'}, 'fast');
			$('.world, .safety, .parents').show();
			active = true;
			$(this).addClass('active');
		}else{
			active = false;
			navMobile.animate({'height': 70 + 'px'}, 'fast');
			$('.world, .safety, .parents').hide();
			$(this).removeClass('active');
		}
	});


	$('nav.mobile .help-category').bind('click', function(){
		navMobile.animate({'height': 70 + 'px'}, 'fast');		
		toogleMenu.removeClass('active');		
	});
	
	var time = 200;
	
	$(".help-page .help-btn").on("click",function(){
		if($(this).parent().find(".answer:visible").length > 0) {
			$(this).parent().find(".answer").hide(time);
			$(this).css({"background-image":"url(img/help-btn-closed.png)"});
		}
		else {
			$(this).parent().find(".answer").show(time);
			$(this).css({"background-image":"url(img/help-btn-open.png)"});
		}
		return false;
	});
	
	$(".help-page li").on("click",function(){
		$(this).find(".help-btn").click();
	});
	
	function b(name) {
		$(".help-category."+name).on("click",function(){
			console.log(name);
			$(".help-category").removeClass("active");
			$(".help-category."+name).addClass("active");
			$(".help-page").hide();
			$(".help-page#"+name).show();
			$(".help-page#"+name+" li").show();
			
			$(".help-page .highlights").contents().unwrap();
			time = 0;
			$(".help-page li .answer:visible").parent().find(".help-btn").click();
			time = 200;
		});
	}
	
	b("register");
	b("world");
	b("safety");
	b("parents");
	b("friends");
	b("games");
	
	$(".help-category.register").click();
	
	$(".search input[type=submit], .search form").on("click, submit",function(){
				
		var searchWord = $(".search input").val().trim();
		if(searchWord.length == 0) return;
		
		$(".help-category").removeClass("active");
		$(".help-page, .help-page li").show();
		time = 0;
		$(".help-page li .answer:visible").parent().find(".help-btn").click();
		time = 200;
		
		$(".help-page .highlight").contents().unwrap();
		
		var questions = [];
		
		$(".help-page li").each(function(){
			var self = $(this); 
			var questionText = self.find("div").eq(0);
			var answerText = self.find("div").eq(1);
			
			var qt = questionText.text();
			
			var words = searchWord.split(" ");
			words = words.map(regExpEscape);
			
			var matches = 0;
			
			var replaceFunction = function(s){
				matches++;
				return "<span class='highlights' style='color:red'>"+s+"</span>";
			};
			
			var regExp = new RegExp("("+words.join(")|(")+")","ig");
			qt = qt.replace(regExp,replaceFunction);
			
			var elements = answerText.find(":not(:has(*))");
			
			elements.each(function(){
				var tx = $(this).text();
				tx = tx.replace(regExp,replaceFunction);
				$(this).html(tx);
			});
			
			if(matches == 0) {
				self.hide();
			}
			else {
				questionText.html(qt);
				//answerText.html(at);
			}
		});
		
	});
	
});
