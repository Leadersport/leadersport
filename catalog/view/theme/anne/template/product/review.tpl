<?php 
$nico_include_path = __DIR__. '/../../';
//vqmod changes paths and the above path fails, check other paths
if (!file_exists($nico_include_path . 'nico_theme_editor/common.inc')) 
{
	$_config =  $this->registry->get('config');
	$nico_include_path = DIR_TEMPLATE . '/' . $_config->get('config_template') . '/';
	
	if (!file_exists($nico_include_path . '/nico_theme_editor/common.inc')) $nico_include_path = dirname(__FILE__) . '/../../';
}

if (file_exists($nico_include_path . 'nico_theme_editor/common.inc')) require_once($nico_include_path . 'nico_theme_editor/common.inc');
global $_config;
?>

<div class="all-review">Все отзывы</div>
<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="table-rewiew">
  <tr>
    <td class="autor-td"><div class="autor"><?php echo $review['author']; ?></div>
	     <div class="rewiew-stars"> <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?>
	</div>
	</td>
    <td class="rewiew-td">
	<div class="rewiew-text"><?php echo $review['text']; ?><span class="rewiew-date"><?php echo $review['date_added']; ?></span></div>
	</td>
  </tr>
  <tr>
    <td colspan="2">

	  </td>
  </tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
