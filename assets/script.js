$('#dashboard-table a').click(function(e){
	e.preventDefault();
	var id = /\d+/.exec($(this).attr('href'));
	if($(this).attr('href').indexOf('edit')!== -1)
	{
		$('#product-action .modal-title').text('Edit Product - '+id);
	}
	else
	{
		$('#product-action .modal-title').text('Are you sure you want to delete Product '+id+'?');
	}
	$.get($(this).attr('href'),function(res){
		$('#product-action .modal-body').html(res);
	});
	$('#product-action').modal();
	return false;
});
$('.col-xs-6.text-right button').click(function(e){
	e.preventDefault();
	$('#product-action .modal-title').text('Add a new Product');
	$.get('/dashboard/create_product',function(res){
		$('#product-action .modal-body').html(res);
	});
	$('#product-action').modal();
	return false;
});