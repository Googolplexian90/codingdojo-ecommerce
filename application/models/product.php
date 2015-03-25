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
		$query = 'SELECT products.name,products.price,images.url FROM similar_products
				  LEFT JOIN products ON similar_products.similar_id=products.id
				  LEFT JOIN images ON images.product_id=products.id
				  WHERE similar_products.product_id=? and images.main=1';
		return $this->db->query($query,array($id))->result();
	}
	function search_albums($form)
	{
		$query = 'SELECT products.*,images.url as img FROM products
				  LEFT JOIN images ON products.id=images.product_id
				  LEFT JOIN products_genres ON products.id=products_genres.product_id';
		$where = ' ';
		$values = array();
		foreach ($form as $col=>$val)
		{
			$where .= $col . '=?';
			$values[]=$val;
		}
		$where .= 'images.main=1';
		$query .= $where;
		return $this->db->query($query,$values)->result();
	}
	function create_album($post) {
		$this->db->query('INSERT INTO products (name, description, price, inventory, created_at) VALUES(?,?,?,?, NOW())', array($post['name'], $post['description'], $post['price'], $post['inventory']));
	}

	function add_image($post) {
		$this->db->query('INSERT INTO images(product_id, url, main, created_at) VALUES(?, ?, ?, NOW())', array($post['product_id'], $post['url'], $post['main']));
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
		          group by genres.id";
		return $this->db->query($query)->result();
	}
	function show_images($id) {

		return $this->db->query('SELECT * FROM images where product_id=?', array($id))->result();
	}
	function show_main_images() {
		return $this->db->query('select * from images where main=1')->result();
	}

}

?>