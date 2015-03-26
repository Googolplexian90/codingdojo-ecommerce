<?php if(!isset($product))
{
	$product = array(null,null,null,null,null);
} ?>
<div class="row">
	<form action="<?= $action ?>" class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
		<div class="form-group">
			<label for="name">Name: </label>
			<input class="form-control" type="text" name="name" <?= $product[0] ?>>
		</div>
		<div class="form-group">
			<label for="description">Description: </label>
			<textarea name="description" class="form-control" row="5"><?= $product[1] ?></textarea>
		</div>
		<div class="form-group">
			<label for="price">Price: </label>
			<input class="form-control" type="text" name="price"<?= $product[2] ?>>
		</div>
		<div class="form-group">
			<label for="genres">Genres: </label>
			<select class="form-control" multiple="multiple" name="genres">
				<?php foreach($genres as $genre)
				{ ?>
					<option value="<?= $genre[0] ?>"<?= ($genre[2]) ? ' selected="selected"' : '' ?>><?= $genre[1] ?></option>
				<?php } ?>
			</select>
		</div>
<?php /*		<form action="/products/create_genre" method="post">
			<div class="form-group">
				<label>or add a new genre </label>
				<input type="text" name="name" class="form-control">
			</div>
		</form> */ ?>
		<div class="form-group">
			<label for="image">New image: </label>
			<input type="file" name="image">
		</div>
		<div class="form-group">
			<label>Current Image</label>
			<?= !empty($product[3]) ? '<img src="/assets/images/'.$product[3].'">' : '<p class="help-block">No image saved</p>' ?>
		</div>
		<div class="form-group">
			<label for="inventory">Inventory: </label>
			<input class="form-control" name="inventory" type="text" <?= $product[4] ?>>
		</div>
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-success" formaction="/products/preview">Preview</button>
		<button type="submit" class="btn btn-primary">Save</button>
	</form>
</div>
