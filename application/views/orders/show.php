<div class="row">
	<aside class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
		<h4>Order ID: <?= $order->id ?></h4>
		<p>Customer Shipping Info:<br>
			name: <?= $order->shipping['name'] ?><br>
			address: <?= $order->shipping['address1'] ?><br>
			city: <?= $order->shipping['city'] ?><br>
			state: <?= $order->shipping['state'] ?><br>
			zip: <?= $order->shipping['zip'] ?></p>
		<p>Customer Billing Info:<br>
			name: <?= $order->billing['name'] ?><br>
			address: <?= $order->billing['address1'] ?><br>
			city: <?= $order->billing['city'] ?><br>
			state: <?= $order->billing['state'] ?><br>
			zip: <?= $order->billing['zip'] ?></p>
	</aside>
	<div class="col-xs-12 col-sm-6 col-md-8 col-lg-9">
	<?php $data['thead'] = array('ID','Item','Price','Quantity','Total');
	$data['tbody'] = $tbody;
	$this->view->views('partials/table',$data);	?>
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<p>Status: shipped</p>
			</div>
			<div class="col-xs-12 col-sm-6">
				<p>Sub total: $29.98<br>
					Shipping: $1.00<br>
					Total Price: $30.98</p>
			</div>
		</div>
	</div>
</div>