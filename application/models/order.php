<?php

class Order extends CI_Model {

	function get_all() {
		$query = 'SELECT * FROM orders
				  LEFT JOIN billings ON billings.id=orders.billing_id
				  LEFT JOIN addresses ON addresses.id=billings.address_id';
		return $this->db->query($query)->result();
	}

	function get_order($id) {
		$query = $this->db->query('SELECT * FROM orders WHERE id = ?', array($id));
		return $query->row();
	}

	function create_order($data) {
		$query = 'INSERT INTO orders(billing_id,shipping_id,status,created_at) VALUES(?,?,1, NOW())';
		$s_id = $this->check_address($data['shipping']);
		$b_addr = $this->check_address($data['billings']);
		$form = array('addr'=>$b_addr,'card'=>$data['card'],'expire'=>$data['month'].'/'.$data['year']);
		$b_id = $this->check_billing($form);
		$values = array($b_id, $s_id);
		$this->db->query($query,$values);
		return true;
	}

	function update_order($data) {

		$query = $this->db->query('UPDATE orders SET name = ?, description =?, price=?, updated_on= NOW() WHERE id = ?', array($data['name'], $data['description'], $data['price'], $data['id']));

		return $query;

	}
	function destroy_order($id) {
		$query = $this->db->query('DELETE FROM orders WHERE id = ?', array($id));
		return $query;
	}
	function create_address($form) {
		$query = 'INSERT INTO addresses(line_1,line_2,city,state,zip,created_at) VALUES(?,?,?,?,?,NOW())';
		$values = array($form['address1'],$form['address2'],$form['city'],$form['state'],$form['zip']);
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
	function create_billing($data){
		$query = 'INSERT INTO billings(address_id,card,expires,created_at) VALUES(?,?,?,NOW())';
		$values = array($data['addr'],$data['card'],$data['expire']);
		$this->db->query($query,$values);
		return $this->db->insert_id();
	}
	function check_billing($data) {
		$query = 'SELECT * FROM billings WHERE address_id=? and card=?';
		$res = $this->db->query($query,array($data['addr'],$data['card']))->row();
		if(empty($res))
		{
			return $this->create_billing($data);
		}
		else
		{
			return $res->id;
		}
	}
}

// end of Order model