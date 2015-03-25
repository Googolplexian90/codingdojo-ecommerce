<?php

class Product extends CI_Model {

	function show_all_albums() {
		// $query = $this->db->query('SELECT * FROM products');
		// return $query->result();
		return $this->db->query('SELECT * FROM products')->result();
	}

	function show_one_album($id) {
		$query = $this->db->query('SELECT * FROM products WHERE id = ?', array($id));
		return $query->row();
	}

	function create($post) {
		$query = $this->db->query('INSERT INTO products (name, description, price, created_at) VALUES(?,?,?, NOW())', array($post['name'], $post['description'], $post['price']));
		return $query;
	}

	function add_image($post) {
		$query = $this->db->query('INSERT INTO images(product_id, url, main, created_at) VALUES(?, ?, ?, NOW())', array($post['product_id'], $post['url'], $post['main']));
		return $query;
	}

	function add_genre($post) {
		$query = $this->db->query('INSERT INTO genres(product_id, name, created_at) VALUES(?, ?, NOW())', array($post['product_id'], $post['name']));
		return $query;
	}

	function update($post) {
		$query = $this->db->query('UPDATE products SET name = ?, description =?, price=?, updated_at= NOW() WHERE id = ?', array($post['name'], $post['description'], $post['price'], $post['id']));
		return $query;
	}

	function destroy($id) {
		$query = $this->db->query('DELETE FROM products WHERE id = ?', array($id));
		return $query;
	}

}

?>