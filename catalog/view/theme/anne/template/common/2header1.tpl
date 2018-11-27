<?php
global $opencart_version;
?>
<div id="header">
  <div class="container">
    <div class="row">
	<div class="col-md-4 col-sm-4">
	</div>
		
	<div id="logo" class="col-md-4 col-sm-4">
	  <?php if ($logo) { ?>
	  <a href="<?php echo $home; ?>" id="image-logo">
		<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
	  </a>
	  <?php } ?>
	  <h1 id="text-logo"><a href="<?php echo $home; ?>"><span><?php echo $name; ?></span></a></h1>
	</div>
	
		<?php echo $cart; ?>

	  <?php if ($opencart_version > 1564) echo $search; else {?>
	  <div class="search-col clearfix">
		<form action="/" class="navbar-form navbar-search navbar-right" role="search">
		  <div class="input-group"> 

			  <button type="submit" class="btn btn-default icon-search"></button> 
			
			  <?php if (isset($search)) {?>
			  <input type="text" name="search" class="search-query col-xs-4" autocomplete="off" placeholder="<?php if (isset($text_search)) echo $text_search; ?>" value="<?php if (isset($search)) echo $search; ?>" />
			  <?php } else {?>
				<?php if (isset($filter_name)) { ?>
					<input type="text" name="filter_name" autocomplete="off" class="search-query col-xs-8" value="<?php echo $filter_name; ?>" /> 
				<?php } else { ?>
					<input type="text" id="search_input" autocomplete="off" class="search-query col-xs-4" name="filter_name" value="<?php echo $text_search;?>"/>
				<?php } ?>
			  <?php }?>	

		  </div>
		  </form>				  
	  </div>
	  <?php } ?>
	  	  
 	<?php $menu = nico_get_modules('menu');if($menu) foreach ($menu as $module) echo $module;?>

	</div>
  </div>
</div>
