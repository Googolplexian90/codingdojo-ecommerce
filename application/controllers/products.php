<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');
}

class Products extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Product');
		if (!$this->session->userdata('cart') && !$this->session->userdata('admin')) {
			$this->session->set_userdata('cart', array());
		}

	}

	public function index() {
		$this->load->view('partials/header', array('title' => 'All Products'));
		// $data['products'] = $this->Product->show_all_albums();
		// $data['categories'] = $this->Product->show_genres();
		$this->load->view('products/list');
		$this->load->view('partials/footer');
	}

	public function search_all() {
		$form = $this->input->post(null, true);
		$data = $this->Product->find($form);
		$this->load->view('products/show_all', $data);
	}

	public function genre($id, $page = 0) {
		$this->load->view('partials/header', array('title' => '(Products Page) Tshirts', 'h1' => 'Tshirts'));
		$search = $this->Product->get_genre($id);
		$data   = $this->Product->find($search);
		$this->load->view('products/show_all', $data);
		$this->load->view('partials/footer');
	}

	public function show($id) {
		$product = $this->Product->show_one_album($id);
		$this->load->view('partials/header', array('title' => '(Product Page)'));
		//$data['images'] = $this->Product->get_images($id);
		$data['product'] = $product;
		//$data['related'] = $this->Product->find($product['name']);
		$this->load->view('products/show', $data);
		$this->load->view('partials/footer');
	}

	public function edit($id) {
		if (!$this->session->userdata('admin')) {
			redirect('/products');
		}
		$data['product'] = $this->Product->show_one_album($id);
		$data['images']  = $this->Product->get_images($id);
		$data['genres']  = $this->Product->get_product_genres($id);
		$this->load->view('products/edit', $data);
	}
	public function add() {
		if (!$this->session->userdata('admin')) {
			redirect('/products');
		}
		$this->load->view('products/new');
	}
	public function delete($id) {
		if (!$this->session->userdata('admin')) {
			redirect('/products');
		}
		$this->load->view('products/destroy', array('product' => $this->Product->show($id)));
	}
	public function destroy($id) {
		if (!$this->session->userdata('admin')) {
			redirect('/products');
		}
		$this->Product->destroy($id);
		redirect('/dashboard/products');
	}
}

//end of products controller