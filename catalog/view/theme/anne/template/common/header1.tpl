<?php
global $opencart_version;
?>
<div id="header" class="container2">
  <!-- div class="container" -->
  

	  
	<div class="left col-sm-4 visible-md visible-lg">
            <!-- 
                <div class="search-select">
                    <div class="search-icon"></div>
                </div>
                            
                <div class="menu-select">
                    <div class="menu-select-icon"></div>                
                </div>
            -->            
        </div>  
	  
  
    	<div class="middle col-sm-6 col-md-4 logo-head">
  
		<div class="logo">
		  <?php if ($logo) { ?>
		  <a href="<?php echo $home; ?>" class="image-logo">
			<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
		  </a><?php } ?><h4 class="text-logo"><a href="<?php echo $home; ?>"><span><?php echo $name; ?></span></a></h4>
		</div>
	</div>
	
	<div class="middle col-sm-6 col-md-4 head-right">
  	 
	 <div class="reg"><a href="/index.php?route=account/login" title="Регистрация"><span class="user-icon"></span> <span class="hidden-xs hidden-sm hidden-md"></span></a></div>
	 
	 <div class="wh"><a href="/index.php?route=account/wishlist" title="В избранном (0)"><span class="heart-icon"></span> </a></div>
	 
	 	 
	 <?php echo $cart; ?>


  <!-- /div -->
  </div>
  
    	<div class="lider-menu">
  	  <?php if ($opencart_version > 1564) echo $search; else {?>
	  <div class="search-col clearfix">
		<form action="/" class="navbar-form navbar-search navbar-right" role="search">
		  <div class="input-group"> 

			  <button type="submit" class="icon-search"></button> 
			
			
			
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
	  
	<?php 
	 	$outside = '';
	 	$menu = nico_get_modules('menu');if($menu) foreach ($menu as $module) 
	 	{
			$outside_start = strpos($module, '<!-- outside -->');
			$outside_end = strpos($module, '<!-- end outside -->');
			if ($outside_start !== false) 
			{
				$outside .= substr($module, $outside_start, $outside_end - $outside_start);
				echo substr_replace($module, '', $outside_start, $outside_end - $outside_start);
			} else
			echo $module;
		}?>	  

	  </div>

  
</div>
<?php echo $outside;?>
