<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent:: __construct();
		$this->output->enable_profiler();
		if(!$this->session->userdata('admin')) redirect(baseurl());
	}
	function orders()
	{
		$this->load->model('Order');
		$data = $this->Order->show_all();
		$this->load->view('partials/header');
		$this->load->view('dashboard',$data);
		$this->load->view('partials/footer');
	}
	function products()
	{
		$this->load->model('Product');
		$data = $this->Product->show_all();
		$this->load->view('partials/header');
		$this->load->view('dashboard',$data);
		$this->load->view('partials/footer');
	}
}
// end of dashboard controller