<?php
namespace Template;
final class Twig {
	private $twig;
	private $data = array();
	
	public function __construct() {
		// include and register Twig auto-loader
		if (file_exists(DIR_SYSTEM . 'library/template/Twig/Autoloader.php'))
		{
			include_once DIR_SYSTEM . 'library/template/Twig/Autoloader.php';
			
			\Twig_Autoloader::register();	
			
			// specify where to look for templates
			$loader = new \Twig_Loader_Filesystem(DIR_TEMPLATE);	
			
			// initialize Twig environment
			$this->twig = new \Twig_Environment($loader, array('autoescape' => false));			
		}	
	}	
	
	public function set($key, $value) {
		$this->data[$key] = $value;
	}
	
	
	public function render($template, $cache = false) {

		$file = DIR_MODIFICATION . 'catalog/view/theme/' . $template . '.tpl';
		if (!is_file($file)) 
		{
			$file = DIR_TEMPLATE . $template . '.tpl';
		}

		//sometimes for ajax requests theme name is not added
		if (!is_file($file)) 
		{
			$theme = 'default';//todo: get theme from config but $config not available yet with $this->config
			$file = DIR_TEMPLATE . $theme . '/template/' . $template . '.tpl';
		}

		if (is_file($file)) {
			extract($this->data);

			ob_start();

			require(modification($file));

			return ob_get_clean();
		}

		// specify where to look for templates
		$loader = new \Twig_Loader_Filesystem(DIR_TEMPLATE);

		// initialize Twig environment
		$config = array('autoescape' => false);

		if ($cache) {
			$config['cache'] = DIR_CACHE;
		}

		$this->twig = new \Twig_Environment($loader, $config);
		
		try {
			// load template
			$template = $this->twig->loadTemplate($template . '.twig');
			
			return $template->render($this->data);
		} catch (Exception $e) {
			trigger_error('Error: Could not load template ' . $template . '!');
			exit();	
		}	
	}
}
