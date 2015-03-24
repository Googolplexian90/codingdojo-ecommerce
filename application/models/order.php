<?php

class Orders extends CI_Model {

	function get_all() {
		$query = $this->db->query('SELECT * FROM products');
		return $query->result();
		// return $this->db->query('SELECT * FROM products')->result_array();
	}

	function get_product($id) {
		$query = $this->db->query('SELECT * FROM products WHERE id = ?', array($id));
		return $query->row();
	}

	function create($data) {
		$query = $this->db->query('INSERT INTO products SET name = description, price, created_on) VALUES(?,?,?, NOW())', array($data['name'], $data['description'], $data['price']));

		return $query;
	}

	function update($data) {

		$query = $this->db->query('UPDATE products SET name = ?, description =?, price=?, updated_on= NOW() WHERE id = ?', array($data['name'], $data['description'], $data['price'], $data['id']));

		return $query;

	}
	function destroy($id) {
		$query = $this->db->query('DELETE FROM products WHERE id = ?', array($id));
		return $query;
	}

}

?>