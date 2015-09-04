$(function(){
	
	$('.toogle').click(function(){
		$('#list-mobile').toggle();
	});

	$('.help-category').bind('click', function(){
		var clicado = $('.help-category.active');
		clicado.removeClass('active');
		var element = $(this);
		element.prependTo('nav.mobile');
	});

	$('.ranking-category').bind('click', function(){
		var clicado = $('.ranking-category.active');
		clicado.removeClass('active');
		var element = $(this);
		element.prependTo('nav.mobile');
	});	

});