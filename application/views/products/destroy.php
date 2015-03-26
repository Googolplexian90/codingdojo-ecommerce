<div class="row">
	<div class="col-xs-12">
		<table class="table">
			<tbody>
				<?php foreach($product as $key=>$field) {
					echo "<tr><td>{$key}</td><td>{$field}</td></tr>";
				} ?>
			</tbody>
		</table>
		<button type="button" class="btn btn-default" data-dismiss="modal">No! Get me out of here.</button>
		<a class="text-danger text-right" href="/products/destroy/<?= $product->id ?>">Yes, delete this.</a>
	</div>
</div>