$(document).ready(function(){
	$('.blind').click(function() {
		$('#ally_Menu_Ul').toggle();
	});
	
	$('#reply_Modal').on('click',function(){
		$('#reply_InsertWrap').css('display','flex');
		
	})
	$('.close').on('click',function(){
		$('#reply_InsertWrap').css('display','none');
	})
});