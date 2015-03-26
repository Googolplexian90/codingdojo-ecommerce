<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent:: __construct();
		if(!$this->session->userdata('admin')) redirect(base_url());
	}
	function orders()
	{
		$this->load->model('Order');
		$orders = $this->Order->get_all();
		$data['table']['thead']=array('Order ID','Name','Date','Billing Address','Total','Status');
		$data['table']['tbody']=array();
		foreach($orders as $order)
		{
			$data['table']['tbody'][] = array($order->id,$order->first_name . ' ' . $order->last_name,date('Y-m-j',strtotime($order->created_at)),$order->line_1.' '.$order->city.' '.$order->state.' '.$order->zip,'$0','Order in Progress');
		}
		$data['pagination']=false;
		$this->load->view('partials/header',array('title'=>'Admin Dashboard | Orders'));
		$this->load->view('dashboard',$data);
		$this->load->view('partials/footer');
	}
	function products()
	{
		$this->load->model('Product');
		$products = $this->Product->show_all_albums();
		$data['table']['thead']=array('Picture','ID','Name','Artist','Inventory Count','action');
		$data['table']['tbody']=array();
		foreach($products as $product)
		{
			$data['table']['tbody'][]=array('<img src="/assets/images/'.$product->image_link.'">',$product->id,$product->name,$product->artist,$product->inventory,'<a href="/dashboard/edit_product/'.$product->id.'">edit</a> | <a href="/dashboard/delete_product/'.$product->id.'">delete</a>');
		}
		$this->load->view('partials/header',array('title'=>'Admin Dashboard | Products'));
		$data['pagination']=false;
		$this->load->view('dashboard',$data);
		$this->load->view('partials/footer');
	}
	function create_product()
	{
		$this->load->model('Product');
		$data['action']='/products/create';
		$gen = $this->Product->get_genres();
		$data['genres']=array();
		foreach($gen as $genre)
		{
			$cont = false;
			foreach($data['genres'] as $res)
			{
				if($res[0]==$genre->id)
				{
					$cont = true;
					break;
				}
			}
			if($cont)
			{
				continue;
			}
			else
			{
				$data['genres'][]= array($genre->id,$genre->name,0);
			}
		}
		$this->load->view('products/form',$data);
	}
	function edit_product($id)
	{
		$this->load->model('Product');
		$data['action']='/products/update';
		$product=$this->Product->show_one_album($id);
		$data['product']=array($product->name,$product->description,$product->price,$product->image_link,$product->inventory);
		$gen = $this->Product->get_genres();
		$data['genres']=array();
		foreach($gen as $genre)
		{
			$cont = false;
			foreach($data['genres'] as $key=>$res)
			{
				if($res[0]==$genre->id)
				{
					if($res[2]==0&&$genre->product_id==$id)
					{
						$data['genres'][$key][2]=1;
						$cont = true;
						break;
					}
					else
					{
						$cont=true;
						break;
					}
				}
			}
			if($cont) 
			{
				continue;
			}
			else
			{
				if($genre->product_id==$id)
				{
					$data['genres'][] = array($genre->id,$genre->name,1);
				}
				else
				{
					$data['genres'][] = array($genre->id,$genre->name,0);
				}
			}
		}
		$this->load->view('products/form',$data);
	}
	public function delete_product($id) {
		$this->load->model('Product');
		$data['product']=$this->Product->show_one_album($id);
		$this->load->view('products/destroy',$data);
	}
}
// end of dashboard controller