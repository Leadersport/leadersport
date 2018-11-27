<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicogrid';

class ControllerModuleNicogrid extends NicoModule {
	private $error = array(); 
	
	public function index() 
	{   
		//echo $this->config->get('config_template'); 
		$this->init($data);
		$this->categories($data);
		$this->manufacturers($data);
		$this->extensions($data);
		
		$this->load->model('tool/image');
		//$this->load->model('tool/nicoimage');
		
		//var_dump($data);
		//var_dump($_POST);
		//var_dump($data['modules'][1]['menu']);
		foreach($data['modules'] as $nr => $module)
		{
			$json = json_decode(html_entity_decode($data['modules'][$nr]['grid']));
			//var_dump($data['modules'][$nr]['grid']);
			//var_dump($json);
			foreach ($json as $grid_element)
			{
				//generate thumb if not available
				$this->model_tool_image->resize(utf8_substr(DIR_IMAGE . $grid_element->img, utf8_strlen(DIR_IMAGE)), 100, 100);
			}
			//'thumb' => $this->model_tool_image->resize(utf8_substr($image, utf8_strlen(DIR_IMAGE)), 100, 100),
			//if (isset($item['img'])) $item['img'] = $this->model_tool_nicoimage->cropsize($item['img'], 100 * $item['size_x'] , 100 * $item['size_y']);
		}
//		  var_dump($data);
				
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicogrid', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicogrid.tpl', $data));
		} else
		{
			$this->template = 'module/nicogrid.tpl';
			$this->data = &$data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		$opencart_version = (int)str_replace('.','',VERSION);

		$extension_path = 'module/';
		
		if ($opencart_version >= 2300)
		{
			$extension_path = 'extension/module/';
		}

		global $_nico_module;
		$permission = $this->user->hasPermission('modify', "module/$_nico_module") || 
					  $this->user->hasPermission('modify', "extension/module/$_nico_module");
	
        // Check Permissions
        if (!$permission ) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicogrid extends ControllerModuleNicogrid {}; 
