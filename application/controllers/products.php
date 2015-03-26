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

	public function index($page=1)
	{
		$this->load->view('partials/header',array('title'=>'All Products'));
		$products = $this->Product->show_all_albums();
		if(count($products)>15)
		{
			$data['pagination']=true;
			$data['pager']=array();
			$data['pager'][] = ($page===1) ? 0 : 1;
			$data['pager'][] = ($page-1>0) ? $page-1 : 0;
			$data['pager'][] = $page;
			$data['pager'][] = ceil(count($products)/15);
			$offset = ($page-1) * 15;
			for($i=0;$i<count($products);)
			{
				if($offset===0&&$i<15)
				{
					$i++;
				}
				elseif($offset>0)
				{
					array_shift($products);
					$offset--;
				}
				else
				{
					array_pop($products);
				}
			}
		}
		else
		{
			$data['pagination']= false;
		}
		foreach($products as $product)
		{
			$data['products'][] = array('id'=>$product->id,'name'=>$product->name,'price'=>$product->price,'image'=>$product->image_link);
		}
		$data['genres'] = $this->Product->show_genres();
		$this->load->view('products/list',$data);
		$this->load->view('partials/footer');
	}

	public function search_all() {
		$form = $this->input->post(null, true);
		$data = $this->Product->find($form);
		$this->load->view('products/show_all', $data);
	}

	public function genre($id, $page = 0) {
		$this->load->view('partials/header', array('title' => 'All Products | (Genre) '));
		$search = $this->Product->search_albums(array('products_genres.genre_id'=>$id));
		foreach($search as $product)
		{
			$data['products'][] = array('name'=>$product->name,'price'=>$product->price,'image'=>$product->img);
		}
		//$data   = $this->Product->find($search);
		$this->load->view('products/list', $data);
		$this->load->view('partials/footer');
	}

	public function show($id) {
		$product = $this->Product->show_one_album($id);
		$this->load->view('partials/header',array('title'=>$product->name.' '));
		$data['product'] = $product;
		$data['related'] = $this->Product->show_related_album($product->id);
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
	public function add_cart()
	{
		$cart = $this->session->userdata('cart');
		$cart[$this->input->post('product',true)]=$this->input->post('qty',true);
		$this->session->set_userdata('cart',$cart);
		$redirect = '/products/show/'.$this->input->post('product');
		redirect($redirect);
	}
	public function delete($id)
	{
		if(!$this->session->userdata('admin'))
		{
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
	public function remove_cart($id)
	{
		$cart = $this->session->userdata('cart');
		unset($cart[$id]);
		$this->session->set_userdata('cart',$cart);
		redirect('/orders/cart');
	}
}

//end of products controller