<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller {

	// Whatever you want in every new function you create...
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Product');
		if(!$this->session->userdata('cart')&&!$this->session->userdata('admin'))
		{
			$this->session->set_userdata('cart',array());
		}
		$this->output->enable_profiler();
	}

	public function index()
	{
		$this->load->view('partials/header',array('title'=>'Home','h1'=>'Sign In'));
		// Grabbing all the products and categories from the db and passing them to the show_all view
		// $this->load->view('partials/footer') loads all the js after the doc has been loaded (good practice - faster?)
		$data['products'] = $this->Product->show_all();
		$data['categories'] = $this->Product->show_categories();
		$this->load->view('products/show_all',$data);
		$this->load->view('partials/footer');
	}
	public function search_all()
	{
		// storing... post data
		// Searching for stuff from db
		$form = $this->input->post(null,true); // null, true?
		$data = $this->Product->find($form);
		// Loading what you find on the show_all page
		$this->load->view('products/show_all',$data);
	}
	public function category($id,$page=0)
	{
		$this->load->view('partials/header',array('title'=>'(Products Page) Tshirts','h1'=>'Tshirts'));
		// Get all products that share the same category id
		$search = $this->Product->get_category($id);
		$data = $this->Product->find($search);
		// View page!
		$this->load->view('products/show_all',$data);
		$this->load->view('partials/footer');
	}
	public function show($id) // show_single
	{
		// Function in the product model that gets a particular product by id
		$product = $this->Product->show($id);
		$this->load->view('partials/header',array('title'=>'(Product Page) '.$product['name']));
		// Show specific image for one product
		$data['images'] = $this->Product->get_images($id);
		// Sets product to a variable
		$data['product'] = $product;
		// Use that variable to get related products...
		$data['related'] = $this->Product->find($product['name']);
		// Pass this information to the show page
		$this->load->view('products/show',$data);
		$this->load->view('partials/footer');
	}
	public function edit($id)
	{
		if(!$this->session->userdata('admin'))
		{
			redirect('/products');
		}
		$data['product'] = $this->Product->show($id);
		$data['images'] = $this->Product->get_images($id);
		// Getting the category of that specific product
		$data['categories'] = $this->Product->get_product_categories($id);
		$this->load->view('products/edit',$data);
	}
	public function add()
	{
		if(!$this->session->userdata('admin'))
		{
			redirect('/products');
		}
		$this->load->view('products/new');
	}
	public function delete($id)
	{
		if(!$this->session->userdata('admin'))
		{
			redirect('/products');
		}
		// Sends you to the destroy page with product id
		$this->load->view('products/destroy',array('product'=>$this->Product->show($id)));
	}
	public function destroy($id)
	{
		if(!$this->session->userdata('admin'))
		{
			redirect('/products');
		}
		// Destroys the product
		$this->Product->destroy($id);
		redirect('/dashboard/products');
	}
}

//end of products controller



// class Products extends CI_Controller {

// 	public function __construct() {
// 		parent::__construct();
// 		$this->output->enable_profiler();
// 		$this->load->model("Product");
// 	}

// 	// public function index() {

// 	// }

// 	public function show_all() {
// 		// Filter
// 		// Search
// 		// Pagination
// 		$products = $this->Product->get_all();
// 		$this->load->view();
// 	}

// 	public function show_single() {
// 		// Buy (set session data)
// 		// Select img
// 	}

// 	public function edit() {
// 		/* Admin Only */
// 		// Edit Info
// 		// Delete?
// 	}

// 	public function delete() { /* destroy? */
// 		/* Admin Only */
// 	}

// 	public function create() {
// 		/* Admin Only */
// 		// Same form as edit
// 	}

// }

// ?>