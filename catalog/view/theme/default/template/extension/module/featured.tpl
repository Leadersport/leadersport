
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12 prod prod-featured">
    <div class="product">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
         <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
         <p class="descr"><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <div class="price">
		<p>
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
		  </p>
        </div>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
   </div>
 
   	<!--Mask hover-->
		<div class="hover-content">
		<div class="category">Mountain bike</div>
		<div class="prod-hover-middle-wrap">
		<div class="prod-hover-middle">
		<div class="prod-hover-left">
		<div class="prod-hover-shop">
		
		<a class="add-to-cart btn" onclick="cart.add('<?php echo $product['product_id']; ?>'<?php if (isset($product['minimum'])) {?>, '<?php echo $product['minimum']; ?>'<?php }?>);"><?php echo $button_cart; ?><span class="cart-icon-mini"></span></a>
		</div>
		</div>
		<div class="prod-hover-right">
		
		<div class="prod-hover-compare">
		<a class="compare-button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></a>
		</div>
		
		<div class="prod-hover-wish">
		<a class="whish-button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></a>
		</div>

		</div>
		</div>
		</div>
		
		</div>
 <!--->

 </div>
  </div>
  <?php } ?>

<div class="block-two-grid redux col-sm-12 col-lg-6">
<div class="col-sm-3">
<span class="badge">new</span>
<div class="two-grid-1">Lifestyle</div>
<div class="two-grid-2">Waterfly:</div>
<div class="two-grid-3">Running Shoes</div>
<div class="two-grid-button"><a href="#">More info</a></div>
</div>
<div class="col-sm-9 skeyt-img">
<img src="image/skeyt.png">
</div>
</div>