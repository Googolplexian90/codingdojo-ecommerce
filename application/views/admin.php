<h1 class="text-center">Admin Login Page</h1>
<?php if($this->session->flashdata('errors')) { ?>
<div class="row text-danger">
	<div class="col-xs-12">
		<h3>There was one or more errors with your submission.</h3>
		<?php echo $this->session->flashdata('errors'); ?>
	</div>
</div>
<?php } ?>
<div class="row">
	<div class="col-xs-12 col-sm-10 col-md-6 col-sm-offset-1 col-md-offset-3">
		<form class="form-horizontal" method="post" action="/users/login">
			<div class="form-group">
				<label class="col-sm-6 col-md-3">Email:</label>
				<div class="col-xs-12 col-sm-6 col-md-9">
					<input class="form-control" type="email" name="email" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-6 col-md-3">Password:</label>
				<div class="col-xs-12 col-sm-6 col-md-9">
					<input class="form-control" type="password" name="password" placeholder="Password">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>