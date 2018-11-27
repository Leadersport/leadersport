<?php
// Version
define('VERSION', '2.3.0.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

include('nico_speed_cache.inc');
if (NICO_PAGE_CACHE) nico_speed_cache_page_init();
// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');if (NICO_PAGE_CACHE) nico_speed_cache_page_save();