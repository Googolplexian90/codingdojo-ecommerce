/*function customEventListeners()
{
	$('form').submit(function(){
		var action = $(this).attr('action');
		$.post(action,$(this).serialize(),function(res){
			$('#container').html(res);
			customEventListeners();
		});
		return false;
	});
	$('button').click(function(){

		var t = $(this).siblings('input:text');
		if(t.attr('disabled')===undefined) {
			if(t.attr('readonly')=='readonly')
			{
				$(this).siblings('input:text').removeAttr('readonly');
			}
			else
			{
				$(this).parent().trigger('submit');
			}
		}
	});
	$(':checkbox').click(function(){
		var t = $(this).siblings(':text');
		if($(this).context.checked)
		{
			t.attr('disabled','disabled');
		}
		else
		{
			t.removeAttr('disabled');
		}
	});
}
$(document).ready(function(){
	$('.no-js').removeAttr('class');
	customEventListeners();
});*/