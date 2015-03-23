<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->output->enable_profiler();
		$this->load->model("Product");
	}

	// public function index() {

	// }

	public function show_all() {
		// Filter
		// Search
		// Pagination
		$products = $this->Product->get_all();
		$this->load->view();
	}

	public function show_single() {
		// Buy (set session data)
		// Select img
	}

	public function edit() {
		/* Admin Only */
		// Edit Info
		// Delete?
	}

	public function delete() { /* destroy? */
		/* Admin Only */
	}

	public function create() {
		/* Admin Only */
		// Same form as edit
	}

}

?>