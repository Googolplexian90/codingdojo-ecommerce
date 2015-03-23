<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orders extends CI_Controller {
	public function index(){}
	public function cart()
	{
		$this->load->view('partials/header',array('title'=>'Shopping Cart'));
	}
}

// end of orders controller