<div class="row">
	<div class="col-xs-6">
		<form class="form-inline">
			<div class="form-group">
				<input class="form-control" type="text" name="search" placeholder="search">
			</div>
		</form>
	</div>
	<div class="col-xs-6 text-right">
		<?php if($table['thead'][0]=='Order ID')
		{ ?>
		<form class="form-inline">
			<div class="form-group">
				<select name="filter" class="form-control">
					<option value="0">Show All</option>
					<option value="1">Order in Progress</option>
					<option value="2">Shipped</option>
					<option value="3">Cancelled</option>
				</select>
			</div>
		</form>
		<?php } 
		else
		{ ?>
			<button class="btn btn-primary" type="button">Add new product</button>
		<?php }?>
	</div>
</div>
<div class="row">
	<div id="dashboard-table">
		<?php $this->load->view('partials/table',$table); ?>
	</div>
	<?php if($pagination) { ?>
	<div class="col-xs-12">
		<ul class="pagination">
			<li>1</li>
		</ul>
	</div>
	<?php } ?>
</div>
<?php if ($table['thead'][0]=='Picture')
{
	$data['id']='product-action';
	$data['modal']=array('title'=>'','html'=>'','footer'=>'');
	$this->load->view('partials/modal',$data);
} ?>