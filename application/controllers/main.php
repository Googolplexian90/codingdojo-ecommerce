<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {

	// public function __construct()
	// {
	// 	parent::__construct();
	// 	$this->output->enable_profiler();
	// }

	public function index()
	{
		$this->load->view('partials/header',array('title'=>'Home','h1'=>'Sign In'));
		echo "Hello World!";
		$this->load->view('partials/footer');
	}
}

//end of main controller