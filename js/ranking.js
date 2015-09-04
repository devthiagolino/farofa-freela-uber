$(function(){

  var toogleMenu  = $('span.up-down-toogle');
  var navMobile   = $('.mobile');
  var active = false;
  toogleMenu.bind('click', function(){    
    if(active == false){
      navMobile.animate({'height': 550 + 'px'}, 'fast');
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


  $('nav.mobile .ranking-category').bind('click', function(){
    navMobile.animate({'height': 70 + 'px'}, 'fast');   
    toogleMenu.removeClass('active');   
  });
   
   var b = function(t) {
        $(".ranking-category."+t).click(function(){
            $(".ranking-category").removeClass("active");
            $(".ranking-category."+t).addClass("active");
            $(".ranking").hide();
            $("#"+t).show();
        });
   };
   
   b("urbzLevel");
   b("noTrilhoDoTrem");
   b("emCimaDaFaixa");
   b("obstakulos");
   b("batalhaDosMitos");
   b("mordix");
   b("emApuros");
   
   $("#content table .inner.urbzLevel").click(function(){
       $(".ranking").hide();
       $("#urbzLevel").show();
   });
   
   $("#content table .inner.urbzMoney").click(function(){
       $(".ranking").hide();
       $("#urbzMoney").show();
   });
    
   $(".ranking-category.urbzLevel").click();
});
