<div class="row">
	<aside class="col-xs-12 col-sm-4 col-md-3">
		<form class="form-inline">
			<div class="form-group">
				<input type="text" name="search" placeholder="product name" class="form-control">
			</div>
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
		</form>
		<p><strong>Categories</strong></p>
		<ul>
		<?php foreach($genres as $li)
		{ ?> 
			<li><a href="/products/genre/<?= $li->id ?>"><?= $li->name ?>(<?= $li->total ?>)</a></li>
		<?php } ?>
			<li><a href="/products">Show All</a></li>
		</ul>
	</aside>
	<div id="content" class="col-xs-12 col-sm-8 col-md-9">
		<div class="row">
			<div class="col-xs-12 col-sm-6"><h1>Albums</h1></div>
			<?php if($pagination) { ?>
			<div class="hidden-xs col-sm-6">
				<ul class="pager">
					<li><a href="">first</a></li>
					<li><a href="">prev</a></li>
					<li><span>2</span></li>
					<li><a href="">last</a></li>
				</ul>
			</div>
			<?php } ?>
			<div class="col-xs-12 col-sm-6 col-sm-offset-6">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-5 col-md-3">Sorted by</label>
						<div class="col-xs-12 col-sm-7 col-md-9">
							<select class="form-control">
								<option value="price">Price</option>
								<option value="popular">Most Popular</option>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="listing" class="row">
		<?php foreach($products as $product)
		{ ?>
			<div class="col-xs-4">
				<img src="/assets/images/<?= $product['image'] ?>">
				<p><a href="/products/show/<?= $product['id'] ?>"><?= $product['name'] ?></a></p>
				<p>$<?= $product['price'] ?></p>
			</div>
		<?php } ?>
		</div>
		<?php if($pagination) { ?>
		<div class="row">
			<div class="col-xs-12 text-center">
			    <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </ul>
			</div>
		</div>
		<?php } ?>
	</div>
</div>