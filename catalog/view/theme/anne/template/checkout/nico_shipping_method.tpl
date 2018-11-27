<?php
if ($shipping_required) {
 if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
	<div class="conts_had2"><?php echo $text_shipping_method; ?></div>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<!--<p><strong><?php echo $shipping_method['title']; ?></strong></p>-->
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" title="<?php echo $quote['title']; ?>" checked="checked" />
	<span></span>
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" title="<?php echo $quote['title']; ?>" />
	<span></span>
    <?php } ?>
    <?php echo $quote['title']; ?><?php echo $quote['text']; ?></label>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } } ?>
