<?php if (!defined('BASEPATH')) {exit('No direct script access is allowed.');
}

class Users extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('Login');
		$this->output->enable_profiler();
	}
	public function index() {
		$this->load->view('partials/header', array('title' => 'Administrator Log in'));
		$this->load->view('admin');
		$this->load->view('partials/footer');
	}
	public function login() {
		$config = array(
			array(
				'field' => 'email',
				'label' => 'Email',
				'rules' => 'trim|required|valid_email',
			),
			array(
				'field' => 'password',
				'label' => 'Password',
				'rules' => 'trim|required',
			)
		);
		$this->form_validation->set_rules($config);
		if (!$this->form_validation->run()) {
			$this->session->set_flashdata('error', validation_errors());
			redirect('/admin');
		} else {
			$form = $this->input->post(null, true);
			$user = $this->Login->login_user($form['email']);
			if ($user) {
				$enc = $this->encrypt($form['password'], $user['password']);
				if ($enc == $user['password']) {
					$data['id']    = $user['id'];
					$data['alias'] = $user['alias'];
					$data['email'] = $user['email'];
					$this->session->set_userdata('admin', $data);
					redirect('/dashboard/orders');
				}
			}
			$this->session->set_flashdata('error', 'The email/password could not be found.');
			redirect('/admin');
		}
	}
	public function logoff() {
		$u = $this->session->all_userdata();
		$this->session->unset_userdata($u);
		redirect('/');
	}

	protected function encrypt($password, $salt = false) {
		if (!$salt) {$salt = bin2hex(openssl_random_pseudo_bytes(22));
		}

		return crypt($password, $salt);
	}
}

// end of users controller