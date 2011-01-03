// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
//   	$('.rating').raty({
//          readOnly: true,
//          path: "/images",
//          number: 10,
//          showHalf:true
//        });
//   	
//   	loadRating();
   	
   	$(".pager .active a").click(function() { 
        return false;
   	});
});

function loadRating(){
 $('.rating').each(function(){
   	    $(this).raty.start($(this).attr('data-rating'),"#" + $(this).attr('id'));
 });
}
