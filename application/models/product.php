<?php

class Product extends CI_Model {

	function show_all_albums() {
		return $this->db->query('SELECT * FROM products')->result();
	}

	function show_one_album($id) {
		$query = $this->db->query('SELECT * FROM products WHERE id = ?', array($id));
		return $query->row();
	}
	function show_related_album($id)
	{
		$query = 'SELECT products.name,products.price,products.image_link FROM similar_products
				  LEFT JOIN products ON similar_products.similar_id=products.id
				  WHERE similar_products.product_id=?';
		return $this->db->query($query,array($id))->result();
	}
	function search_albums($form)
	{
		$query = 'SELECT * FROM products
				  LEFT JOIN products_genres ON products.id=products_genres.product_id';
		$where = '1';
		$values = array();
		foreach ($form as $col=>$val)
		{
			$where .= ' AND '.$col . '=?';
			$values[]=$val;
		}
		$query .= $where;
		return $this->db->query($query,$values)->result();
	}
	function create_album($post) {
		$this->db->query('INSERT INTO products (name, description, price, inventory, created_at) VALUES(?,?,?,?, NOW())', array($post['name'], $post['description'], $post['price'], $post['inventory']));
	}
	function add_genre($post) {
		$this->db->query('INSERT INTO genres(name, created_at) VALUES(?, NOW())', array($post['name']));
	}

	function update($post) {
		$query = $this->db->query('UPDATE products SET name = ?, description =?, price=? WHERE id = ?', array($post['name'], $post['description'], $post['price'], $post['id']));
		return $query->row();
	}

	function destroy($id) {
		$this->db->query('DELETE FROM products WHERE id = ?', array($id));
	}
	function show_genres() {
		$query = "SELECT genres.id,genres.name,count(*) as total from genres
		          left join products_genres on genres.id=products_genres.genre_id
		          GROUP BY genres.id
		          ORDER BY total DESC";
		return $this->db->query($query)->result();
	}

}

?>