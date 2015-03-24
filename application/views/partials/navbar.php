<?php if($this->session->userdata('admin')) 
{ ?>
<nav class="navbar navbar-danger">
	<div class="container-fluid">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <span class="navbar-brand">Dashboard</span>
	    </div><!-- /.navbar-header -->
	    <div id="main-nav" class="collapse navbar-collapse">
	    	<ul class="nav navbar-nav">
	    		<li><a href="/dashboard/orders">Orders</a></li>
	    		<li><a href="/dashboard/products">Products</a></li>
	    	</ul>
	    	<ul class="nav navbar-nav navbar-right">
	    		<li><a href="/users/logoff">logoff</a></li>
	    	</ul>
	    </div><!-- /.navbar-collapse -->
	</div>
</nav>
<?php }
else
{ ?>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="#">uTube</a>
	    </div><!-- /.navbar-header -->
	    <div id="main-nav" class="collapse navbar-collapse">
	    	<ul class="nav navbar-nav navbar-right">
	    		<li><a href="/orders/cart">Shopping cart <span class="badge"><?= count($this->session->userdata('cart')) ?></span></a></li>
	    	</ul>
	    </div><!-- /.navbar-collapse -->
	</div>
</nav>
<?php } ?>