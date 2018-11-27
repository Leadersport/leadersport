<?php
class ControllerModuleBannerpro extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/bannerpro-owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['bannerspro'] = array();
    $data['animation'] = $setting['animation'];
    $data['text'] = $setting['text'];
    $data['banner_bg'] = $setting['banner-bg'];
    $data['texthover'] = $setting['texthover'];
    $data['navigation'] = $setting['navigation'];
    $data['pagination'] = $setting['pagination'];
    
    // Sort Order for banner
    if(isset($setting['banner_image'])){
      $results = $setting['banner_image'];
      usort($results, function($a, $b){
        if($a['sort_order'] === $b['sort_order'])
          return 0;  
        return $a['sort_order'] > $b['sort_order'] ? 1 : -1;
      });
    } else {
      $results = array();
    }

    if (isset($this->request->get['path']) && isset($setting['categories'])) {
      $parts = explode('_', (string)$this->request->get['path']);
      $category_id = (int)array_pop($parts);
      foreach ($setting['categories'] as $banner_category) {
        if ($banner_category == $category_id) { 
          foreach ($results as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
              $data['bannerspro'][] = array(
                'title' => htmlspecialchars_decode($result['banner_image_description'][$this->config->get('config_language_id')]['title'],ENT_QUOTES),
                'link'  => $result['link'],
                'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
              );
            }
          }
          $data['module'] = $module++;

          if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bannerpro.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/bannerpro.tpl', $data);
          } else {
            return $this->load->view('default/template/module/bannerpro.tpl', $data);
          }
        }
      }
    } else {
      foreach ($results as $result) {
        if (is_file(DIR_IMAGE . $result['image'])) {
          $data['bannerspro'][] = array(
            'title' => htmlspecialchars_decode($result['banner_image_description'][$this->config->get('config_language_id')]['title'],ENT_QUOTES),
            'link'  => $result['link'],
            'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
          );
        }
      }
      $data['module'] = $module++;

      if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bannerpro.tpl')) {
        return $this->load->view($this->config->get('config_template') . '/template/module/bannerpro.tpl', $data);
      } else {
        return $this->load->view('default/template/module/bannerpro.tpl', $data);
      }
    }
	}
}