<?php
$data['thead']=array('Item','Price','Quantity','Total');
$data['tbody']=$tbody;
?>
<div class="row">
	<div class="col-xs-12">
		<?php if(count($tbody)>0) {
			$this->load->view('partials/table',$data); ?>
		<p class="text-right">$<?= $total ?><br>
		<a class"btn btn-success" href="/products">Continue Shopping</a></p>
		<?php }
		else
		{ ?>
		<h4>There are no items in your cart<br>
			<a href="/products">Continue Shopping</a></h4>
		<?php } ?>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-6">
		<form class="form-horizontal" method="post" action="/orders/create">
			<h2>Shipping Information</h2>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">First Name:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[first_name]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Last Name:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[last_name]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Address:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[address1]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Address Line 2:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[address2]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">City:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[city]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">State:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[state]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Zipcode:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="shipping[zip]">
				</div>
			</div>
			<h2>Billing Information</h2>
			<div class="form-group">
				<div class="col-xs-12">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="duplicate"> Same as shipping
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">First Name:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[first_name]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Last Name:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[last_name]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Address:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[address1]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Address Line 2:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[address2]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">City:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[city]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">State:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[state]">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Zipcode:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="billings[zip]">
				</div>
			</div>
			<br>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Card:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="card">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Security Code:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<input class="form-control" type="text" name="code">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 col-md-3">Expiration:</label>
				<div class="col-xs-12 col-sm-8 col-md-9">
					<div class="row">
						<div class="col-xs-6 col-md-4">
							<input class="form-control" type="text" name="month" placeholder="MM">
						</div>
						<span class="hidden-xs col-sm-1 text-center" style="padding-left:0;padding-right:0;font-size: 24px; margin: 0 -15px">/</span>
						<div class="col-xs-6 col-md-4">
							<input class="form-control" type="text" name="year" placeholder="YYYY">
						</div>
					</div>
				</div>
			</div>
			<div class="text-right">
				<button type="submit" class="btn btn-primary">Pay</button>
			</div>
		</form>
	</div>
</div>