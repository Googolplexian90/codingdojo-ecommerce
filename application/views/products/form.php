<div class="row">
	<form action="<?php {$action} ?>" class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
		<div class="form-group">
			<label>Name: </label>
			<input class="form-control" type="text" name="name">
		</div>
		<div class="form-group">
			<label>Description: </label>
			<textarea name="description" class="form-control" row="5"></textarea>
		</div>
		<div class="form-group">
			<label>Genres: </label>
			<select class="form-control" multiple name="genres">
				<?php foreach($genres as $genre)
				{ ?>
					<option value="<?= $genre->id ?>"><?= $genre->name ?></option>
				<?php } ?>
			</select>
		</div>
		<form action="/products/create_genre" method="post">
			<div class="form-group">
				<label>or add a new genre </label>
				<input type="text" name="name" class="form-control">
			</div>
		</form>
		<div class="form-group">
			<label>Image: </label>
			<input type="text" name="image" class="form-control">
		</div>
		<ul id="form-images">
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-success">Preview</button>
		<button type="submit" class="btn btn-primary">Save</button>
	</form>
</div>
