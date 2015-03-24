<form action="<?= $action ?>">
	<?php foreach($fields as $field)
	{
		switch($field['type']) {
			case 'checkbox':
			case 'radio': ?>
	<div class="<?= $field['type'] ?>">
		<?php foreach($field['values'] as $value) { ?>
		<label>
			<input name="<?= $field['name'] ?>" type="checkbox" value="<?= $value['val'] ?>"> <?= $value['label'] ?>
		</label>
		<?php } ?>
	</div>
			<?php break;
			case 'textarea': ?>
	<div class="form-group">
		<label for="<?= $field['name'] ?>"><?= $field['label'] ?></label>
		<textarea name="<?= $field['name'] ?>" class="form-control"></textarea>
	</div>
			<?php break;
			case 'select': ?>
	<div class="form-group">
		<select name="<?= $field['name'] ?>" class="form-control" <?= $field['multiple'] ?>>
			<?php foreach($field['value'] as $value) { ?>
			<option value="<?= $value['val'] ?>"><?= $value['label'] ?></option>
			<?php } ?>
		</select>
	</div>
			<?php break
			default: ?>
	<div class="form-group">
		<label for="<?= $field['name'] ?>"><?= $field['label'] ?></label>
		<input type="<?= $field['type'] ?>" class="form-control" name="<?= $field['name'] ?>">
	</div>
		<?php }
	} 
	if(isset($submit)) { ?>
	<button type="submit" class="btn btn-default">$submit</button>
	<?php } ?>
</form>