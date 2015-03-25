<?php 
/* Data that must be past to this file:
  -- div id of the modal, so that we can toggle it with js
  -- modal title (h4 tags)
  -- modal form action (edit versus create)
  -- Information from the DB to populate Genre and images (if applicable)
We're going to be adding a lot more nested forms into this monster, but for now this should appear nice
... maybe
*/

$data = array(
	'id'=>$id,
	'modal'=>array(
		'title'=>$title,
		'html'=>''
	)
);
$data['modal']['html'] = '<div class="row">'. ?>
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
			<option>Classic Rock</option>
			<option>Metal</option>
			<option>Pop</option>
			<option>R&B</option>
			<option>Jazz</option>
			<option>Comedy</option>
		</select>
	</div>
	<div class="form-group">
		<label>or add a new genre </label>
		<input type="text" name="genre" class="form-control">
	</div>
	<div class="form-group">
		<label>Image: </label>
		<input type="text" name="image" class="form-control">
	</div>
	<ul id="form-images">
		<li></li>
		<li></li>
		<li></li>
	</ul>
</form>
<?php ."</div>";
$data['modal']['footer'] = "". ?>
	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	<button type="button" class="btn btn-success">Preview</button>
	<button type="submit" class="btn btn-primary">Save</button
<?php .""; 
$this->load->view('partials/modal',$data); ?>