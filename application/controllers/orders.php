<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orders extends CI_Controller {
	public function index(){}
	public function cart()
	{
		$this->load->model('Product');
		$this->load->view('partials/header',array('title'=>'Shopping Cart'));
		$cart = $this->session->userdata('cart');
		$data['total']=0;
		$data['tbody']=array();
		foreach($cart as $item=>$qty)
		{
			$product = $this->Product->show_one_album($item);
			$data['tbody'][]=array($product->name,$product->price,$qty . '&emsp;<a href="/products/show/'.$item.'">Update</a> <a href="/products/remove_cart/'.$item.'"><span class="glyphicon glyphicon-trash"></span></a>',($qty * $product->price));
			$data['total']+=$qty * $product->price;
		}
		$this->session->set_userdata('cart',$cart);
		$this->load->view('orders/cart',$data);
		$this->load->view('partials/footer');
		$this->output->enable_profiler();
	}
	public function create()
	{
		$config = array(
			array(
				'field'=>'shipping[first_name]',
				'label'=>'First Name',
				'rules'=>'trim|required|alpha'
			),
			array(
				'field'=>'shipping[last_name]',
				'label'=>'Last Name',
				'rules'=>'trim|required|alpha'
			),
			array(
				'field'=>'shipping[address1]',
				'label'=>'Address',
				'rules'=>'trim|required'
			),
			array(
				'field'=>'shipping[address2]',
				'label'=>'Address Line 2',
				'rules'=>'trim'
			),
			array(
				'field'=>'shipping[city]',
				'label'=>'City',
				'rules'=>'trim|required'
			),
			array(
				'field'=>'shipping[state]',
				'label'=>'State',
				'rules'=>'trim|required|alpha|exact_length[2]'
			),
			array(
				'field'=>'shipping[zip]',
				'label'=>'Zipcode',
				'rules'=>'trim|required|number'
			),

			array(
				'field'=>'billings[first_name]',
				'label'=>'Billing First Name',
				'rules'=>'trim|required|alpha'
			),
			array(
				'field'=>'billings[last_name]',
				'label'=>'Billing Last Name',
				'rules'=>'trim|required|alpha'
			),
			array(
				'field'=>'billings[address1]',
				'label'=>'Billing Address',
				'rules'=>'trim|required'
			),
			array(
				'field'=>'billings[address2]',
				'label'=>'Billing Address Line 2',
				'rules'=>'trim'
			),
			array(
				'field'=>'billings[city]',
				'label'=>'Billing City',
				'rules'=>'trim|required'
			),
			array(
				'field'=>'billings[state]',
				'label'=>'Billing State',
				'rules'=>'trim|required|alpha|exact_length[2]'
			),
			array(
				'field'=>'billings[zip]',
				'label'=>'Billing Zipcode',
				'rules'=>'trim|required|number'
			),
			array(
				'field'=>'card',
				'label'=>'Credit Card #',
				'rules'=>'trim|required|number'
			),
			array(
				'field'=>'code',
				'label'=>'Security Card',
				'rules'=>'trim|required|number|exact_length[3]'
			),
			array(
				'field'=>'month',
				'label'=>'Expiration (month)',
				'rules'=>'trim|required|exact_length[2]|less_than[13]|greater_than[0]'
			),
			array(
				'field'=>'year',
				'label'=>'Expiration (year)',
				'rules'=>'required|exact_length[4]|number'
			)
		);
		$this->form_validation->set_rules($config);
		if(!$this->form_validation->run())
		{
			$this->session->set_flashdata('error',validation_errors());
			redirect('/orders/cart');
		}
		else
		{
			$form = $this->input->post(null,true);
			$this->load->model('Order');
			$this->Order->create_order($form);
			//redirect('/products');
		}
	}
	function show($id)
	{
		if(!$this->session->userdata('admin'))
		{
			redirect(base_url());
		}
		$this->load->model('Order');
		//$data = $this->Order->show($id);
		$this->load->view('partials/header');
		$this->load->view('orders/show');
		$this->load->view('partials/footer');
	}
}

// end of orders controller