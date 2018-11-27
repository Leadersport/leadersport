<?php
class ModelExtensionModule extends Model {
	public function addModule($code, $data) {
						/* nico speed cache clear */
						//$files = glob(DIR_CACHE . 'nico_speed_cache_*');

						//clear css
						$files = glob(DIR_TEMPLATE . '/*/css/_nico*.css');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}

						//clear js
						$files = glob(DIR_TEMPLATE . '/*/js/_nico*.js');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}

						//clear speed cache
						$files = glob(DIR_CACHE . '*');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}
				
		$this->db->query("INSERT INTO `" . DB_PREFIX . "module` SET `name` = '" . $this->db->escape($data['name']) . "', `code` = '" . $this->db->escape($code) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "'");
	}
	
	public function editModule($module_id, $data) {
						/* nico speed cache clear */
						//$files = glob(DIR_CACHE . 'nico_speed_cache_*');

						//clear css
						$files = glob(DIR_TEMPLATE . '/*/css/_nico*.css');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}

						//clear js
						$files = glob(DIR_TEMPLATE . '/*/js/_nico*.js');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}
						
						//clear speed cache
						$files = glob(DIR_CACHE . '*');

						if ($files) {
							foreach ($files as $file) {
								if (file_exists($file)) {
									unlink($file);
								}
							}
						}
				
		$this->db->query("UPDATE `" . DB_PREFIX . "module` SET `name` = '" . $this->db->escape($data['name']) . "', `setting` = '" . $this->db->escape(json_encode($data)) . "' WHERE `module_id` = '" . (int)$module_id . "'");
	}

	public function deleteModule($module_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `module_id` = '" . (int)$module_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE '%." . (int)$module_id . "'");
	}
		
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `module_id` = '" . (int)$module_id . "'");

		if ($query->row) {
			return json_decode($query->row['setting'], true);
		} else {
			return array();
		}
	}
	
	public function getModules() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` ORDER BY `code`");

		return $query->rows;
	}	
		
	public function getModulesByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "' ORDER BY `name`");

		return $query->rows;
	}	
	
	public function deleteModulesByCode($code) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE '" . $this->db->escape($code) . "' OR `code` LIKE '" . $this->db->escape($code . '.%') . "'");
	}	
}