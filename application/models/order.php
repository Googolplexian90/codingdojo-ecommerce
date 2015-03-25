<?php

class Order extends CI_Model {

	function get_all() {
		$query = 'SELECT * FROM orders
				  LEFT JOIN billings ON billings.id=orders.billing_id
				  LEFT JOIN addresses ON addresses.id=billing.address_id';
		return $this->db->query($query)->result();
	}

	function get_order($id) {
		$query = $this->db->query('SELECT * FROM orders WHERE id = ?', array($id));
		return $query->row();
	}

	function create_order($data) {
		$query = $this->db->query('INSERT INTO orders SET name = description, price, created_on) VALUES(?,?,?, NOW())', array($data['name'], $data['description'], $data['price']));

		return $query;
	}

	function update_order($data) {

		$query = $this->db->query('UPDATE orders SET name = ?, description =?, price=?, updated_on= NOW() WHERE id = ?', array($data['name'], $data['description'], $data['price'], $data['id']));

		return $query;

	}
	function destroy_order($id) {
		$query = $this->db->query('DELETE FROM orders WHERE id = ?', array($id));
		return $query;
	}

	function billing_address($data) {
		$query = $this->db->query('INSERT INTO orders SET name = line_1, line_2, city, state, zip, created_on) VALUES(?,?,?,?,?, NOW())', array($data['name'], $data['description'], $data['price']));

		return $query;
	}
	function shipping_address($data) {
		$query = $this->db->query('INSERT INTO orders SET name = line_1, line_2, city, state, zip, created_on) VALUES(?,?,?,?,?, NOW())', array($data['name'], $data['description'], $data['price']));

		return $query;
	}
}

// end of Order model