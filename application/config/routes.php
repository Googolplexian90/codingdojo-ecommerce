<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "products";
$route['products/(:num)'] = "products/index/$1";
$route['admin'] = "users";
$route['404_override'] = '';

//end of routes.php