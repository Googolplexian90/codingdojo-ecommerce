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
		$orders = $this->Order->get_all();
		$data['table']['thead']=array('Order ID','Name','Date','Billing Address','Total','Status');
		$data['table']['tbody']=array();
		foreach($orders as $order)
		{
			$data['table']['tbody'][] = array($order->id,$order->first_name . ' ' . $order->last_name,date('Y-m-j',strtotime($order->created_at)),$order->line_1.' '.$order->city.' '.$order->state.' '.$order->zip,'$0','Order in Progress');
		}
		$data['pagination']=false;
		$this->load->view('partials/header',array('title'=>'Admin Dashboard | Orders'));
		$this->load->view('dashboard',$data);
		$this->load->view('partials/footer');
	}
	function products()
	{
		$this->load->model('Product');
		//$data = $this->Product->show_all();
		$this->load->view('partials/header',array('title'=>'Admin Dashboard | Products'));
		$this->load->view('dashboard');
		$this->load->view('partials/footer');
	}
}
// end of dashboard controller