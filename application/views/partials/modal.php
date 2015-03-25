<div id="<?= $id ?>" class="modal fade" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><?= $modal['title'] ?></h4>
			</div>
			<div class="modal-body container-fluid">
				<?= $modal['html'] ?>
			</div>
			<div class="modal-footer">
				<?= $modal['footer'] ?>
			</div>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->