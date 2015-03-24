<?php 
class Login extends CI_Model {        

    public function login_user($login)
    {
    	return $this->db->query('SELECT * FROM users WHERE email = ?', array($login))->row_array();
    }
}
?>