<?php
/**
 *
 * Created Alexandr Solonytskyi.
 * Date: 31.03.2017
 * 15 delivery extensions
 * skype: htc_storm
 * email: alex_storm@ukr.net
 *
 */
class ModelExtensionShippingFlatrussianpost extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/flatrussianpost');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('flatrussianpost_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('flatrussianpost_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$quote_data = array();

			$quote_data['flatrussianpost'] = array(
				'code'         => 'flatrussianpost.flatrussianpost',
				'title'        => $this->language->get('text_description'),
				'cost'         => $this->config->get('flatrussianpost_cost'),
				'tax_class_id' => $this->config->get('flatrussianpost_tax_class_id'),
				'text'         => $this->language->get('')
			);

			$method_data = array(
				'code'       => 'flatrussianpost',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('flatrussianpost_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}