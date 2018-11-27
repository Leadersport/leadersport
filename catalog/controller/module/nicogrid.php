<?php
include_once(DIR_APPLICATION . '/controller/module/nicomodule.inc');
global $_nico_module_counter;
class ControllerModuleNicogrid  extends NicoModule
{
	public function index($setting) 
	{
		if (!$this->is_filter_ok($setting)) return false;

		$this->load->model('tool/image');

		$data = $setting;
		$opencart_version = (int)str_replace('.','',VERSION);

		global $_nico_module_counter;
		if (isset($_nico_module_counter['nicogrid'])) $_nico_module_counter['nicogrid']++; else $_nico_module_counter['nicogrid'] = 0;
		$data['module_id'] = $_nico_module_counter['nicogrid'];

		$data['grid'] = json_decode(html_entity_decode($setting['grid']), true);

		$lang_code = isset($this->session->data['language'])?$this->session->data['language']:$this->language->get('code');
		
		if (!$lang_code || is_object($lang_code)) $lang_code = $lang_code->get('code');
		
		$lang_code = strtolower($lang_code);

		$default_lang = 'en';

		if ($opencart_version >= 2200)
		{
			$default_lang = 'en$gb';
		}
		
		$lang_code = str_replace('-', '$', strtolower($lang_code));

		$max_row = 0;
		$rows = array();
		if (!isset($data['row_height'])) $data['row_height'] = 5;

		$resize_method = 0;
		$resize_factor = 15;
		if (isset($setting['resize_method']))
		{
			if ($setting['resize_method'] == 'cropresize')
			{
				$resize_method = 1;
			} else
			if ($setting['resize_method'] == 'original')
			{
				$resize_method = 2;
			}
		}

		$resize_method_top_image = 0;
		if (isset($setting['resize_method_top_image']))
		{
			if ($setting['resize_method_top_image'] == 'cropresize')
			{
				$resize_method = 1;
			} else
			if ($setting['resize_method_top_image'] == 'original')
			{
				$resize_method = 2;
			}
		}

		if (isset($setting['resize_factor']))
		{
			$resize_factor = $setting['resize_factor'];
		}

		foreach ($data['grid'] as &$item)
		{
			//var_dump($item);
			$max_row = ($max_row < $item['row'])?$item['row']:$max_row;
			$grid[$item['row']][] = &$item;
			
			if (isset($item['img']))
			{
					if ($resize_method == 1)
					$item['img'] = $this->model_tool_image->cropsize($item['img'], $data['row_height'] * $resize_factor * $item['size_x'] , $data['row_height'] * $resize_factor * $item['size_y']);
					else if ($resize_method == 2)
					{
						if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
							$item['img'] = $this->config->get('config_ssl') . 'image/' . $item['img'];
						} else {
							$item['img'] = $this->config->get('config_url') . 'image/' . $item['img'];
						}	
						$item['img'] = $item['img'];
					}
					else
					$item['img'] = $this->model_tool_image->resize($item['img'], $data['row_height'] * $resize_factor * $item['size_x'] , $data['row_height'] * $resize_factor * $item['size_y']);
			}

			if (isset($item['top_img']))
			{
					$width =  $data['row_height'] * $resize_factor * $item['size_x'];
					$height = $data['row_height'] * $resize_factor * $item['size_y'];
					
					if (isset($item['top_img_width']) && $item['top_img_width']) $width = $item['top_img_width'];
					if (isset($item['top_img_height']) && $item['top_img_height']) $height = $item['top_img_height'];
					
					if ($resize_method_top_image == 1)
					$item['top_img'] = $this->model_tool_image->cropsize($item['top_img'], $width , $height);
					else if ($resize_method_top_image == 2)
					{
						if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
							$item['top_img'] = $this->config->get('config_ssl') . 'image/' . $item['top_img'];
						} else {
							$item['top_img'] = $this->config->get('config_url') . 'image/' . $item['top_img'];
						}	
						$item['top_img'] = $item['top_img'];
					}
					else
					$item['top_img'] = $this->model_tool_image->resize($item['top_img'], $width , $height);
			}
			
			//if (isset($item['img'])) $item['img'] = $this->model_tool_image->cropsize($item['img'], $data['row_height'] * 15 * $item['size_x'] , $data['row_height'] * 15 * $item['size_y']);
			
			if (isset($item['subtitle_' . $lang_code])) $subtitle = $item['subtitle_' . $lang_code];else if (isset($item['subtitle_' . $default_lang])) $subtitle = $item['subtitle_' . $default_lang];else $subtitle = '';
			$item['subtitle'] = $subtitle;
			
			if (isset($item['title_' . $lang_code])) $title = $item['title_' . $lang_code];else if (isset($item['title_' . $default_lang])) $title = $item['title_' . $default_lang];else $title = '';
			$item['title'] = $title;

			if (isset($item['content_' . $lang_code])) $content = $item['content_' . $lang_code];else if (isset($item['content_' . $default_lang])) $content = $item['content_' . $default_lang];else $content = '';
			$item['content'] = $content;

			if (isset($item['button_' . $lang_code])) $button = $item['button_' . $lang_code];else if (isset($item['button_' . $default_lang])) $button = $item['button_' . $default_lang];else $button = '';
			$item['button'] = $button;


			if (isset($item['url_' . $lang_code])) $url = $item['url_' . $lang_code];else if (isset($item['url_' . $default_lang])) $url = $item['url_' . $default_lang];else $url = '';
			$item['url'] = $url;
		}

		$data['max_row'] = $max_row;
		$data['group'] = $grid;
		
		
		$data['_this'] = $this;
		$data['button_cart'] = $this->language->get('button_cart');

		return $this->_render('nicogrid', $data);
	}
}
