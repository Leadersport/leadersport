<?php echo $header; ?>
<div class="top-banner bgcolor">
    <div class="container">
        <div class="title-wrap">
            <div class="title-wrap-inner">
               <div class="cat_header">
				    <h2><?php echo $heading_title; ?></h2>
			    </div>
                <div class="path">
				<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 </div>               	
            </div>
        </div>
    </div>
</div>
<div class="container modificate">
 
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row page-account"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	
	<p class="text-hello">
	
	Привет, <strong><?php echo $email; ?></strong> (не <?php echo $email; ?>? <a href="logout">Выйти</a> )
</p>
<p class="text-hello1">
На панели управления вашей учетной записью вы можете просмотреть свои <a href="order-history">последние заказы</a> ,  <a href="change-password">редактировать свои пароли</a> и <a href="edit-account">данные учетной записи</a>.
	
	</p>
	<!--<div class="col-sm-6">
      <h2><?php echo $text_my_account; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul>
	  </div>
	  <div class="col-sm-6">
      <?php if (isset($credit_cards) && $credit_cards) { ?>
      <h2><?php echo $text_credit_card; ?></h2>
      <ul class="list-unstyled">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?>
      <h2><?php echo $text_my_orders; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <?php if ($reward) { ?>
        <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <?php if (isset($text_recurring)) {?><li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li><?php }?>
      </ul>
      <h2><?php echo $text_my_newsletter; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
	  </div>-->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>