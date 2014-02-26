$(document).ready(function(){ 

	$('table.even tr:nth-child(even)').css( 'background', '#fdfdfd');
  
  
  $('ul#nav li:last-child').css( 'margin-right', '0px');

	$('ul#flickr li img').hover(
		function() {
			$(this).stop().animate({opacity: .5}, 350);
		},
		function() {
			$(this).stop().animate({opacity: 1}, 350);
		}
	);


			   
	
	$('.blog-block').hover(
		function() {
			$(this).children('.article-info').stop().animate({"opacity":"1.0"},'normal','linear');
		},
		function() {
			$(this).children('.article-info').stop().animate({"opacity":".5"},'normal','linear');
		}
	);
	

 $('#separator a:not(.button)').hover(
  	function() {
  		$(this).stop().animate({color:"#959595"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#4eb0ed"}, 'fast', 'linear');  	
  	}
  );

 $('#footer a').hover(
  	function() {
  		$(this).stop().animate({color:"#727272"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#4eb0ed"}, 'fast', 'linear');  	
  	}
  );

 
 $('.meta-info a').hover(
  	function() {
  		$(this).stop().animate({color:"#bababa"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#424242"}, 'fast', 'linear');  	
  	}
  );
 
   $('ul.sf-menu li a').hover(
  	function() {
  		$(this).stop().animate({color:"#bababa"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#fff"}, 'fast', 'linear');  	
  	}
  );

$('a.button, button, ul#nav-pagination li').hover(
	function() {
		$(this).stop().animate({"opacity":".7"},'fast','linear');
	},
	function() {
	$(this).stop().animate({"opacity":"1.0"},'fast','linear');
	}
);


  $('ul.sf-menu li a.active').hover(
  	function() {
  		$(this).stop().animate({color:"#aaa"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#fff"}, 'fast', 'linear');  	
  	}
  );
  
   $('a.slider').hover(
  	function() {
  		$(this).stop().animate({color:"#fafafa"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#4eb0ed"}, 'fast', 'linear');  	
  	}
  );



   $('#separator .more-link').hover(
  	function() {
  		$(this).stop().animate({color:"#111"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#777"}, 'fast', 'linear');  	
  	}
  );


  $('#sidebar ul li a, ul#nav-pagination li a').hover(
  	function() {
  		$(this).stop().animate({color:"#4eb0ed"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#424242"}, 'fast', 'linear');  	
  	}
  );

  $('#filter a').hover(
  	function() {
  		$(this).stop().animate({color:"#727272"}, 'fast', 'linear');
  	},
  	
  	function() {
  		$(this).stop().animate({ color:"#727272"}, 'fast', 'linear');  	
  	}
  );

   $('.zoom').css({height: "0px", opacity: .0});
   $('.img-block').hover(
						 function() {
							 	$(this).children('.zoom').stop().animate({height: "120px", opacity: .5},350,'linear');
			
							 },
						 function() {
 	 						    $(this).children('.zoom').stop().animate({height: "0px", opacity: .0},350,'linear');
							 }	 
						 );


		/* Go To TOP Arrow */
		$('#to-top').click(function() {
		    $(window.opera ? 'html' : 'html, body').animate({
		        scrollTop: 0
		    }, 'slow');
		});
		
		
   $("ul.sf-menu").superfish({ 
            pathClass:  'current',
			autoArrows	: false,
			delay:300,
			speed: 'normal',
			animation:   {height:'show'}

        }); 

});