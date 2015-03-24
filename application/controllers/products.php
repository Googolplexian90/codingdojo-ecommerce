<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller {

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
		$data['products'] = $this->Product->show_all();
		$data['categories'] = $this->Product->show_categories();
		$this->load->view('products/show_all',$data);
		$this->load->view('partials/footer');
	}
	public function search_all()
	{
		$form = $this->input->post(null,true);
		$data = $this->Product->find($form);
		$this->load->view('products/show_all',$data);
	}
	public function category($id,$page=0)
	{
		$this->load->view('partials/header',array('title'=>'(Products Page) Tshirts','h1'=>'Tshirts'));
		$search = $this->Product->get_category($id);
		$data = $this->Product->find($search);
		$this->load->view('products/show_all',$data);
		$this->load->view('partials/footer');
	}
	public function show($id)
	{
		$product = $this->Product->show($id);
		$this->load->view('partials/header',array('title'=>'(Product Page) '.$product['name']));
		$data['images'] = $this->Product->get_images($id);
		$data['product'] = $product;
		$data['related'] = $this->Product->find($product['name']);
		// Need to set up many to many rel with products to fill in the above
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
		$this->load->view('products/destroy',array('product'=>$this->Product->show($id)));
	}
	public function destroy($id)
	{
		if(!$this->session->userdata('admin'))
		{
			redirect('/products');
		}
		$this->Product->destroy($id);
		redirect('/dashboard/products');
	}
}

//end of products controller