<?php

class Order extends CI_Model {

	function get_all() {
		$query = 'SELECT * FROM orders
				  LEFT JOIN addresses ON addresses.id=orders.billing_id';
		return $this->db->query($query)->result();
	}

	function get_order($id) {
		$query = $this->db->query('SELECT * FROM orders
								   LEFT JOIN addresses AS shipping ON shipping.id=orders.shipping_id
								   LEFT JOIN addresses AS billings ON billings.id=orders.billing_id 
								   WHERE id = ?', array($id));
		return $query->row();
	}

	function create_order($data,$cart) {
		$query = 'INSERT INTO orders(billing_id,shipping_id,status,created_at) VALUES(?,?,1, NOW())';
		$s_id = $this->check_address($data['shipping']);
		$b_id = $this->check_address($data['billings']);
		$values = array($b_id, $s_id);
		$this->db->query($query,$values);
		$id =  $this->db->insert_id();
		$query2 = 'INSERT INTO products_orders(product_id,order_id,qty) VALUES';
		$values2 = array();
		foreach($cart as $product=>$qty)
		{
			$query2 .='(?,?,?),';
			array_push($values2,$product,$id,$qty);
		}
		$query2 = rtrim($query2,',');
		$this->db->query($query2,$values2);
		return true;
	}
	function create_address($form) {
		$query = 'INSERT INTO addresses(first_name,last_name,line_1,line_2,city,state,zip,created_at) VALUES(?,?,?,?,?,?,?,NOW())';
		$values = array($form['first_name'],$form['last_name'],$form['address1'],$form['address2'],$form['city'],$form['state'],$form['zip']);
		$this->db->query($query,$values);
		return $this->db->insert_id();
	}
	function check_address($form) {
		$query = 'SELECT * FROM addresses WHERE line_1=? AND city=? AND state=?';
		$values = array($form['address1'],$form['city'],$form['state']);
		$res = $this->db->query($query,$values)->result();
		if(count($res)==0)
		{
			return $this->create_address($form);
		}
		elseif(count($res)===1)
		{
			return $res[0]->id;
		}
		else
		{
			foreach($res as $result)
			{
				if($result->line_2==$form['address2']&&$result->zip==$form['zip'])
				{
					return $result->id;
				}
			}
			return $this->create_address($form);
		}
	}
}

// end of Order model