<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-4">
		<p><a href="/">Go Back</a></p>
		<h1><?= $product->name ?></h1>
		<h4><?= $product->artist ?></h4>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-3 col-lg-4">
		<img src="/assets/images/<?= $product->image_link ?>">
	</div>
	<div class="col-xs-12 col-sm-6 col-md-offset-1">
		<?= $product->description ?>
		<form class="form-inline text-right" action="/products/add_cart" method="post">
			<div class="form-group">
				<select class="form-control" name="qty">
					<option value="1">1 ($<?= $product->price * 1 ?>)</option>
					<option value="2">2 ($<?= $product->price * 2 ?>)</option>
					<option value="3">3 ($<?= $product->price * 3 ?>)</option>
					<option value="4">4 ($<?= $product->price * 4 ?>)</option>
					<option value="5">5 ($<?= $product->price * 5 ?>)</option>
				</select>
			</div>
			<input type="hidden" name="product" value="<?= $product->id ?>">
			<button class="btn btn-primary" type="submit">Buy</button>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<h3>Similar Items</h3>
		<div class="row">
		<?php foreach($related as $product)
		{ ?>
			<div class="similar-products">
				<a href="/products/show/<?= $product->id ?>"><img src="/assets/images/<?= $product->image_link ?>">
				<p><?= $product->name ?></p></a>
				<p>$<?= $product->price ?></p>
			</div>
		<?php } ?>
		</div>
	</div>
</div>