<?php

class Product extends CI_Model {

	function find() {
		$query = $this->db->query('SELECT * FROM products');
		return $query->result();

	}

	function show($id) {
		$query = $this->db->query('SELECT * FROM products WHERE id = ?', array($id));
		return $query->row();
	}

	function create($data) {
		$query = $this->db->query('INSERT INTO products SET name = description, price, created_at) VALUES(?,?,?, NOW())', array($data['name'], $data['description'], $data['price']));

		return $query;
	}

	function update($data) {

		$query = $this->db->query('UPDATE products SET name = ?, description =?, price=?, updated_at= NOW() WHERE id = ?', array($data['name'], $data['description'], $data['price'], $data['id']));

		return $query;

	}
	function destroy($id) {
		$query = $this->db->query('DELETE FROM products WHERE id = ?', array($id));
		return $query;
	}

}

?>