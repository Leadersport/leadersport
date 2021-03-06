<?php 
echo $header;
?>
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
<div class="container nicocheckout modificate"> 
		<div class="row box checkout_form">       

<div class="error"></div>

<div class="row">
<div class="tabs tabs_cart">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-block-tovar" data-toggle="tab">Выбраный товар</a></li>
            <li><a href="#tab-block-dostavka" data-toggle="tab">Информация о доставке</a></li>
            <li><a href="#tab-block-oplata" data-toggle="tab">Оплата</a></li>
            </ul>
</div>

<div class="tab-content tabscontent">

<div class="tab-pane active" id="tab-block-tovar" itemprop="product-cart">
				<!--Add cart-->
			
						<table id="cart_table" class="table table-bordered table-responsive">
					      <thead>
						<tr>
						 <th class="text-center"><?php echo $column_image; ?></th>
						  <th class=""><?php echo $column_name; ?></th>
						  <th class="hidden-xs"><?php echo $column_model; ?></th>
						  <th class="hidden-xs"><?php echo $column_quantity; ?></th>
						  <th class="hidden-xs"><?php echo $column_price; ?></th>
						  <th class=""><?php echo $column_total; ?></th>
						</tr>
					      </thead>
					      <tbody>
						<?php foreach ($products as $product) { ?>
						<tr>
						
				<td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
						
						  <td class=""><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						    <?php foreach ($product['option'] as $option) { ?>
						    <br />
						    &nbsp;<small> - <?php echo $option['name']; ?>: <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
						    <?php } ?></td>
							
						  <td class="hidden-xs"><?php echo $product['model']; ?></td>
						  <td class="hidden-xs"><?php echo $product['quantity']; ?></td>
						  <td class="hidden-xs"><?php echo $product['price']; ?></td>
						  <td class=""><?php echo $product['total']; ?></td>
						</tr>
						<?php } ?>
						<?php foreach ($vouchers as $voucher) { ?>
						<tr>
						  <td class="text-left"><?php echo $voucher['description']; ?></td>
						  <td class="text-left hidden-xs"></td>
						  <td class="text-right hidden-xs">1</td>
						  <td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
						  <td class="text-right"><?php echo $voucher['amount']; ?></td>
						</tr>
						<?php } ?>
					      </tbody>
					      <!--<tfoot>
						<?php foreach ($totals as $total) { ?>
						<tr>
						  <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
						  <td class="text-left"><?php echo $total['text']; ?></td>
						</tr>
						<?php } ?>
					      </tfoot>-->
					    </table>

							<!--Add cart-->

</div>




<div class="tab-pane" id="tab-block-dostavka">

			


<div class="col-md-6 login-block">	
			
	<?php if (!isset($address)) {?>
	<div class="row">
		
	<div class="col-md-12">
			
			
	<!--<h2><?php echo $heading_title; ?></h2>-->

							
	<!--<h3><?php echo $text_cart;?></h3>-->
					   
	
	<!--<p class="well"><?php echo $text_returning_customer; ?> &nbsp;<a href="#" onclick="jQuery('.login-form').toggle();return false;"><?php echo $text_i_am_returning_customer; ?></a></p>-->
			    
				<div class="conts_had1">Аккаунт</div>
			    <div class="login-form registerbox clearfix" style="display:block">
				<div class="row">
				<div class="col-md-12 message"></div>
				<form class="form-inline" role="form">
			        <div class="col-md-12">
				<div class="form-group">
				  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
				  <input type="text" name="email" value="" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-email" class="form-control" />
				</div>
				<div class="form-group">
				  <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
				  <input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-password" class="form-control" />
				</div>
				<div class="button-mini-cart1">
				    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" class="button-mini-cart" />
				   
				</div>
				 <div class="forgot"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
				</div>
				
			      </form>
			    </div>
			</div>
		    </div>
		</div>
		<?php } else { ?>
		<div class="you-registr-block">
		<div class="you-registr">Вы уже вошли в систему</div>
		</div>
		<?php } ?>
	
			</div>
				


 <div class="col-md-6 dostavka-block">
	

	<div class="row box checkout_form">
		    <div class="col-md-12 register_block forma-contacts">
			<div class="row">
				  <div class="col-md-12">
				    <div class="conts_had">Заполните все поля</div>
				  </div>
				  
				  <?php //if (!isset($address)) {?>
				  <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
				    <label class="control-label"><?php echo $entry_customer_group; ?></label>
				    <?php foreach ($customer_groups as $customer_group) { ?>
				    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
				    <div class="radio">
				      <label>
					<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
					<?php echo $customer_group['name']; ?></label>
				    </div>
				    <?php } else { ?>
				    <div class="radio">
				      <label>
					<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
					<?php echo $customer_group['name']; ?></label>
				    </div>
				    <?php } ?>
				    <?php } ?>
				  </div>
				  <div class="form-group required col-md-6 form-name">
				    <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
				    <input type="text" name="firstname" value="<?php if (isset($address['firstname'])) echo $address['firstname']; elseif (isset($firstname)) echo $firstname; ?>" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-payment-firstname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group required col-md-6 last-name">
				    <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
				    <input type="text" name="lastname" value="<?php if (isset($lastname)) echo $lastname;?>" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-payment-lastname" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group required col-md-6 form-email-first">
				    <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
				    <input type="text" name="email" value="<?php if (isset($email)) echo $email;?>" placeholder="<?php echo str_replace(':','',$entry_email); ?>" id="input-payment-email" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <div class="form-group required  col-md-6 form-tel">
				    <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
				    <input type="text" name="telephone" value="<?php if (isset($telephone)) echo $telephone;?>" placeholder="<?php echo str_replace(':','',$entry_telephone); ?>" id="input-payment-telephone" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <?php if (!$checkout_hide_fax) {?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
				    <input type="text" name="fax" value="<?php if (isset($fax)) echo $fax;?>" placeholder="<?php echo str_replace(':','',$entry_fax); ?>" id="input-payment-fax" class="form-control" <?php if (isset($customer_id)) {?> readonly<?php }?>/>
				  </div>
				  <?php }?>

				  <div class="col-md-12 padding-none pay-address">
				    <!--<h3 class="clearfix"><?php echo $text_your_address; ?></h3>-->

			      <?php if ($addresses) { ?>
				  <?php if (isset($customer_id)) {?>	  
			      <div class="radio">
				 <label>
				 
				  <input type="radio" name="payment_address" value="existing" checked="checked" onclick="jQuery('#payment-address-new').hide()" />
				  <span></span>
				  <?php echo $text_address_existing; ?></label>
			      </div>
			      <div id="payment-existing">
					<select name="payment_address_id" class="form-control">
				  <?php foreach ($addresses as $address) { ?>
				  <?php if (isset($payment_address_id) && $address['address_id'] == $payment_address_id) { ?>
				  <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } ?>
				  <?php } ?>
				</select>
			      </div>
			      <?php } ?>
			    <?php if (isset($customer_id)) {?>	  
			      <div class="radio">
				  <label>
				  <input type="radio" name="payment_address" value="new" onclick="jQuery('#payment-address-new').show();"/>
				  <span></span>
				  <?php echo $text_address_new; ?></label>
			      </div>
				  <?php } ?>
			      <?php } ?>
				  </div>

				  <div id="payment-address-new" <?php if (isset($customer_id) && $addresses) {?> style="display:none"<?php }?>>
				  <?php if (!$checkout_hide_company){?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
				    <input type="text" name="company" value="<?php if (isset($company)) echo $company;?>" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-payment-company" class="form-control" />
				  </div>
				   <?php } else {?>
					   <input type="hidden" name="company" value="" />
				   <?php }?>
				  
				  <?php if (isset($entry_company_id)) { ?>
				  <?php if (!$checkout_hide_company_id){?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company_id; ?></label>
				    <input type="text" name="company_id" value="<?php if (isset($company_id)) echo $company_id; ?>" placeholder="<?php echo str_replace(':','',$entry_company_id); ?>" id="input-payment-company-id" class="form-control" />
				  </div>
				   <?php } else {?>
					   <input type="hidden" name="company_id" value="" />
				   <?php }?>

				  <?php if (!$checkout_hide_tax_id){?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-tax-id-"><?php echo $entry_tax_id; ?></label>
				    <input type="text" name="tax_id" value="<?php if (isset($tax_id)) echo $tax_id; ?>" placeholder="<?php echo str_replace(':','',$entry_tax_id); ?>" id="input-tax-id-" class="form-control" />
				  </div>
				   <?php } else {?>
					   <input type="hidden" name="tax_id" value="" />
				   <?php } }?>
				  

				  
  				  <?php if (!$checkout_hide_address_2) {?>
				  <div class="form-group col-md-12">
				    <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				    <input type="text" name="address_2" value="<?php if (isset($address_2)) echo $address_2;?>" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-payment-address-2" class="form-control" />
				  </div>
  				  <?php }?>

  				  <?php if (!$checkout_hide_country) {?>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
				    <select name="country_id" id="input-payment-country" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($countries as $country) { ?>
				      <?php if ($country['country_id'] == $country_id) { ?>
				      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
				      <?php } else { ?>
				      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
				      <?php } ?>
				      <?php } ?>
				    </select>
				  </div>
				  <?php } ?>
				  
  				  <?php if (!$checkout_hide_zone) {?>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-zone"><?php echo $entry_zone;?></label>
				    <select name="zone_id" id="input-payment-zone" class="form-control">
				    </select>
				  </div>
  				  <?php }?>

				  
  				  <?php if (!$checkout_hide_city) {?>
				  <div class="form-group col-md-6 form-email-first">
				    <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
				    <input type="text" name="city" value="<?php if (isset($city)) echo $city;?>" placeholder="<?php echo str_replace(':','',$entry_city); ?>" id="input-payment-city" class="form-control" />
				  </div>
  				  <?php }?>
				  
   				  <?php if (!$checkout_hide_postcode) {?>
				  <div class="form-group col-md-6 form-tel">
				    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
				    <input type="text" name="postcode" value="<?php if (isset($postcode)) echo $postcode;?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-payment-postcode" class="form-control" />
				  </div>
				  <?php } ?>
			
				  <div class="form-group col-md-12 form-adress">
				    <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
				    <input type="text" name="address_1" value="<?php if (isset($address_1)) echo $address_1;?>" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-payment-address-1" class="form-control" />
				  </div>

			
				</div>

				<?php if (!isset($customer_id)) {?>	
				<div class="form-group col-md-12 registr">
					<label>
					<input type="checkbox" name="register" onclick="if (this.checked == true) jQuery('.register-form').show(); else jQuery('.register-form').hide();">&nbsp;<?php echo $text_register; ?></label>
				</div>    
				<?php } ?>  
				
				
				<div class="register-form" style="display:none">
				      <div class="form-group required col-md-6 pass-reg">
					<label class="control-label" for="input-payment-password"><?php echo $entry_password; ?></label>
					<input type="password" name="password" value="" placeholder="<?php echo str_replace(':','',$entry_password); ?>" id="input-payment-password" class="form-control" />
				      </div>
				      <div class="form-group required col-md-6 pass-reg1">
					<label class="control-label" for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
					<input type="password" name="confirm" value="" placeholder="<?php echo str_replace(':','',$entry_confirm); ?>" id="input-payment-confirm" class="form-control" />
				      </div>
				</div>
			<?php /*} else {?>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
				    <p><?php echo $firstname; ?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
				    <p><?php echo $lastname; ?></p>
				  </div>
				  <div class="form-group required  col-md-6">
				    <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
				    <p><?php echo $email; ?></p>
				  </div>
				  <div class="form-group required  col-md-6">
				    <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
				    <p><?php echo $telephone; ?></p>
				  </div>
				  <?php if (!empty($fax)) {?>
				  <div class="form-group col-md-12">
				    <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
				    <p><?php echo $fax; ?></p>
				  </div>
				  <?php }?>

				  <div class="col-md-12">
				    <h3 class="clearfix"><?php echo $text_your_address; ?></h3>
				  </div>

				  <?php if (!empty($address['company'])) {?>
				  <div class="form-group col-md-6">
				    <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
				    <p><?php echo $address['company']; ?></p>
				  </div>
				  <?php }?>
			
				  <?php if (!empty($address['address_1'])) {?>
				  <div class="form-group required col-md-12">
				    <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
				    <p><?php echo $address['address_1'];?></p>
				  </div>
				   <?php }?>
				  
				  <?php if (!empty($address['address_2'])) {?>
				  <div class="form-group col-md-12">
				    <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				    <p><?php echo $address['address_2'];?></p>
				  </div>
				   <?php }?>
				   
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
				    <p><?php echo $address['country'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-zone"><?php echo $entry_zone;; ?></label>
				    <p><?php echo $address['zone'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
				    <p><?php echo $address['city'];?></p>
				  </div>
				  <div class="form-group required col-md-6">
				    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
				    <p><?php echo $address['postcode'];?></p>
				  </div>
			    
			<?php } */?>
		      

















		<?php if ($shipping_required) {?>
			<div class="shiptobilling clearfix form-group">
				 <h3><?php echo $text_checkout_shipping_address; ?></h3>
				    <label class="checkbox-inline">
					    <input type="checkbox" name="shipping_address" value="new" <?php if (isset($address_id)) echo 'checked="checked"';?> onclick="if (this.checked == true) jQuery('.shipping-address').show(); else jQuery('.shipping-address').hide();"><?php echo $text_address_new; ?>
				    </label>
			    </div>
			    <div class="shipping-address" <?php if (/*isset($shipping_address_id) || */isset($customer_id)) echo 'style="display:none"'; else echo 'style="display:none"'?>>
			      <?php if ($addresses) { ?>
				  <?php if (isset($customer_id)) {?>	  
			      <div class="radio">
				<label>
				  <input type="radio" name="shipping_address" value="existing" checked="checked" onclick="jQuery('#shipping-new').hide()" />
				  <?php echo $text_address_existing; ?></label>
			      </div>
			      <div id="shipping-existing">
				
				<select name="shipping_address_id" class="form-control">
				  <?php foreach ($addresses as $address) { ?>
				  <?php if (isset($shipping_address_id) && $address['address_id'] == $shipping_address_id) { ?>
				  <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
				  <?php } ?>
				  <?php } ?>
				</select>
			      </div>
			      <?php } ?>
			    <?php if (isset($customer_id)) {?>	  
			      <div class="radio">
				  <label>
				  <input type="radio" name="shipping_address" value="new" onclick="jQuery('#shipping-new').show();"/>
				  <?php echo $text_address_new; ?></label>
			      </div>
				  <?php } ?>
			      <?php } ?>
			      <br />
			      <div id="shipping-new" style="display: <?php echo (($addresses && isset($customer_id)) ? 'none' : 'block'); ?>;">
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
				  <div class="">
				    <input type="text" name="shipping_firstname" value="" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-shipping-firstname" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
				  <div class="">
				    <input type="text" name="shipping_lastname" value="" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-shipping-lastname" class="form-control" />
				  </div>
				</div>
				<?php if (!$checkout_hide_company_id){?>
				<div class="form-group">
				  <label class="control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
				  <div class="">
				    <input type="text" name="shipping_company" value="" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-shipping-company" class="form-control" />
				  </div>
				</div>
			   <?php } else {?>
				   <input type="hidden" name="shipping_company" value="" />
			   <?php }?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
				  <div class="">
				    <input type="text" name="shipping_address_1" value="" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-shipping-address-1" class="form-control" />
				  </div>
				</div>
				
				<?php if (!$checkout_hide_address_2) {?>
				<div class="form-group">
				  <label class="control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
				  <div class="">
				    <input type="text" name="shipping_address_2" value="" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-shipping-address-2" class="form-control" />
				  </div>
				</div>
				<?php }?>
				
				<?php if (!$checkout_hide_city) {?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
				  <div class="">
				    <input type="text" name="shipping_city" value="" placeholder="<?php echo str_replace(':','',$entry_city); ?>" id="input-shipping-city" class="form-control" />
				  </div>
				</div>
				<?php }?>
				
 			 <?php if (!$checkout_hide_postcode) {?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
				  <div class="">
				    <input type="text" name="shipping_postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-shipping-postcode" class="form-control" />
				  </div>
				</div>
				<?php }?>
				
				<?php if (!$checkout_hide_country) {?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
				    <select name="shipping_country_id" id="input-shipping-country" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($countries as $country) { ?>
				      <?php if ($country['country_id'] == $country_id) { ?>
				      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
				      <?php } else { ?>
				      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
				      <?php } ?>
				      <?php } ?>
				    </select>
				</div>
				<?php }?>
				
 				<?php if (!$checkout_hide_zone) {?>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
				  <div class="">
				    <select name="shipping_zone_id" id="input-shipping-zone" class="form-control">
				    </select>
				  </div>
				</div>
				<?php }?>
				
				<?php if (isset($custom_fields)) foreach ($custom_fields as $custom_field) { ?>
				<?php if ($custom_field['type'] == 'select') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <select name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
				      <?php } ?>
				    </select>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'radio') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="radio">
					<label>
					  <input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'checkbox') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="checkbox-inline">
					<label>
					  <input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'text') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'textarea') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <textarea name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'file') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				    <input type="hidden" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'date') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="date" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'datetime') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="datetime-local" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'time') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="time" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php } ?>
			      </div>
			</div>	
			    <div class="form-group col-md-12 shipping-method">
				<?php if ($error_warning) { ?>
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
				    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" checked="checked" />
					<span></span>
				    <?php } else { ?>
				    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" />
					<span></span>
				    <?php } ?>
				    <?php echo $quote['title']; ?> <?php echo $quote['text']; ?></label>
				</div>
				<?php } ?>
				<?php } else { ?>
				<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				</div>
	<?php }?>	
	
	
	
	
	
	


			  </div>
		    
			
			
			
			
			
			
			
	
			
			
			
			
			
			
			
			
			
			
			
			
			
			</div>				
			</div>



		
			
			
				</div>
				
				
			
				

				</div>


				
				
				
<div class="tab-pane" id="tab-block-oplata">
				
				<div class="your_order">
		    		
						
						<?php if (!$checkout_hide_gift) {?>
						<br/>
						<div class="panel panel-default">
						  <div class="panel-heading">
							<h4 class="panel-title"><a href="#collapse-voucher" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $voucher_title; ?> <i class="fa fa-caret-down"></i></a></h4>
						  </div>
						  <div id="collapse-voucher" class="panel-collapse collapse">
							<div class="panel-body">
							  <label class="control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
							  <div class="input-group">
								<input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
								<span class="input-group-btn">
								<input type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher" data-loading-text="<?php echo isset($text_loading)?$text_loading:'Loading...'; ?>"  class="btn btn-primary" />
								</span> </div>
							  <script type="text/javascript"><!--
						$('#button-voucher').on('click', function() {
						  $.ajax({
							url: 'index.php?route=checkout/nicocheckout/voucher',
							type: 'post',
							data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
							dataType: 'json',
							beforeSend: function() {
							  $('#button-voucher').button('loading');
							},
							complete: function() {
							  $('#button-voucher').button('reset');
							},
							success: function(json) {
							  $('.alert').remove();

							  if (json['error']) {
								$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

								//$('html, body').animate({ scrollTop: 0 }, 'slow');
							  } else $('select[name=\'country_id\']').trigger('change');

							  if (json['redirect']) {
								location = json['redirect'];
							  }
							}
						  });
						});
						//--></script>
							</div>
						  </div>
						</div>
					  <?php } ?>
						
					<?php if (!$checkout_hide_coupon) {?>
						<div class="panel panel-default">
						  <div class="panel-heading">
							<h4 class="panel-title"><a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $coupon_title; ?> <i class="fa fa-caret-down"></i></a></h4>
						  </div>
						  <div id="collapse-coupon" class="panel-collapse collapse">
							<div class="panel-body">
							  <label class="control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
							  <div class="input-group">
								<input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
								<span class="input-group-btn">
								<input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo isset($text_loading)?$text_loading:'Loading...'; ?>"  class="btn btn-primary" />
								</span></div>
							  <script type="text/javascript"><!--
						$('#button-coupon').on('click', function() {
							$.ajax({
								url: 'index.php?route=checkout/nicocheckout/coupon',
								type: 'post',
								data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
								dataType: 'json',
								beforeSend: function() {
									$('#button-coupon').button('loading');
								},
								complete: function() {
									$('#button-coupon').button('reset');
								},
								success: function(json) {
									$('.alert').remove();

									if (json['error']) {
										$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

										//$('html, body').animate({ scrollTop: 0 }, 'slow');
									} else $('select[name=\'country_id\']').trigger('change');

									if (json['redirect']) {
										location = json['redirect'];
									}
								}
							});
						});
						//--></script>
							</div>
						  </div>
						</div>
					  <?php } ?>
						
					<?php if (!$checkout_hide_points) {?>
					<div class="panel panel-default">
					  <div class="panel-heading">
						<h4 class="panel-title"><a href="#collapse-reward" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $reward_title; ?> <i class="fa fa-caret-down"></i></a></h4>
					  </div>
					  <div id="collapse-reward" class="panel-collapse collapse">
						<div class="panel-body">
						  <label class="control-label" for="input-reward"><?php echo $entry_reward; ?></label>
						  <div class="input-group">
							<input type="text" name="reward" value="<?php echo $reward; ?>" placeholder="<?php echo $entry_reward; ?>" id="input-reward" class="form-control" />
							<span class="input-group-btn">
							<input type="submit" value="<?php echo $button_reward; ?>" id="button-reward" data-loading-text="<?php echo isset($text_loading)?$text_loading:'Loading...'; ?>"  class="btn btn-primary" />
							</span></div>
						  <script type="text/javascript"><!--
					$('#button-reward').on('click', function() {
						$.ajax({
							url: 'index.php?route=checkout/nicocheckout/reward',
							type: 'post',
							data: 'reward=' + encodeURIComponent($('input[name=\'reward\']').val()),
							dataType: 'json',
							beforeSend: function() {
								$('#button-reward').button('loading');
							},
							complete: function() {
								$('#button-reward').button('reset');
							},
							success: function(json) {
								$('.alert').remove();

								if (json['error']) {
									$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

									//$('html, body').animate({ scrollTop: 0 }, 'slow');
								} else $('select[name=\'country_id\']').trigger('change');

								if (json['redirect']) {
									location = json['redirect'];
								}
							}
						});
					});
					//--></script>
						</div>
					  </div>
					</div>
					<?php } ?>
									
					<div class="payment-method">						    
					<?php if ($error_warning) { ?>
					<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
					<?php } ?>
					<?php if ($payment_methods) { ?>
					<p><?php echo $text_payment_method; ?></p>
					<?php foreach ($payment_methods as $payment_method) { ?>
					<div class="radio">
					  <label>
					    <?php if ($payment_method['code'] == $code || !$code) { ?>
					    <?php $code = $payment_method['code']; ?>
					    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" checked="checked" />
						<span></span>
					    <?php } else { ?>
					    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" />
						<span></span>
					    <?php } ?>
					    <?php echo $payment_method['title']; ?></label>
					</div>
					<?php } ?>
					<?php } ?>
					</div>
					
					<!--<p><strong><?php echo $text_comments; ?></strong></p>
					<p>
					  <textarea name="comment" rows="3" class="form-control"><?php echo $comment; ?></textarea>
					</p>-->
		
					
					<div class="payment pull-right clearfix">
					    <?php if ($payment) echo $payment; else {?>
					    <input type="button" class="btn btn-primary" data-loading-text="<?php if (isset($text_loading)) echo $text_loading;else echo 'loading ...' ?>" id="button-register" value="<?php echo $heading_title;?>">
					    <?php }?></div>
					</div>





	
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	
	
<script src="catalog/view/javascript/tabbedcontent.min.js"></script>	
<script>
        var tabs;
        jQuery(function($) {
            tabs = $('.tabscontent').tabbedContent({loop: true}).data('api');

            // switch to tab...
            $("a[href='#click-to-switch']").on('click', function(e) {
                var tab = prompt('Tab to switch to (number or id)?');
                if (!tabs.switchTab(tab)) {
                    alert('That tab does not exist :\\');
                }
                e.preventDefault();
            });

            // Next and prev actions
            $('.controls a').on('click', function(e) {
                var action = $(this).attr('href').replace('#', '');
                tabs[action]();
                e.preventDefault();
            });
        });
    </script>

	<div class="pagination controls">
	<div class="left-pagination"><a href="#prev"><i class="fa fa-angle-left"></i>Назад</a></div>
	<div class="right-pagination"><a href="#next">Следующий шаг <i class="fa fa-angle-right"></i></a></div>
	</div>
</div>	
</div>
</div>


<script type="text/javascript"><!--
var error = true;
var checkout_shipping_reload_payment = 0;

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/nicocheckout/login_validate',
        type: 'post',
        data: $('.login-form :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},  
        complete: function() {
            $('#button-login').button('reset');
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('.login-form .message').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
           } else
           {
			   document.location.reload(true);
			   window.location = location.href;
           }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Register
$(document).delegate('#button-register', 'click', function() 
{
	
	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');
	
    $.ajax({
        url: 'index.php?route=checkout/nicocheckout/validate',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},  
        complete: function() {
            $('#button-register').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
                        
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
				error = true;
                if (json['error']['warning']) {
                    $('.error').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                
		for (i in json['error']) {
                    $('[name="' + i + '"], [name="' + i + '_id"]').after('<div class="text-danger">' + json['error'][i] + '</div>');
		}
            } else 
	    {
			error = false;
			jQuery('[name=\'payment_method\']:checked').click();
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$('select[name=\'country_id\'], select[name=\'shipping_country_id\']').on('change', function() {
	_this = this;
	$.ajax({
        url: 'index.php?route=checkout/nicocheckout/country&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
			$(_this).before(' <i class="fa fa-spinner fa-spin"></i>');
        },
        complete: function() {
			$('.fa-spinner').remove();
        },          
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			            
            html = '<option value=""><?php echo $text_select; ?></option>';
            
            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                    
                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }
    
                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
            
            if (_this.name == 'shipping_country_id') 
            $('select[name=\'shipping_zone_id\']').html(html).val("");
            else $('select[name=\'zone_id\']').html(html).val("");
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

/*
$('input[name=\'postcode\'], input[name=\'city\']').on('change', function() 
{
	jQuery("select[name=\'zone_id\']").change();
});
*/

var _postcode_interval;
$('input[name=\'postcode\'], input[name=\'city\']').on('keypress', function() 
{
	clearTimeout(_postcode_interval);
	_postcode_interval = setTimeout(function () 
	{
		jQuery("select[name=\'zone_id\']").change();
	}, 1000)
});


$('select[name=\'country_id\'], select[name=\'zone_id\'], select[name=\'shipping_country_id\'], select[name=\'shipping_zone_id\'], input[type=\'radio\'][name=\'payment_address\'], input[type=\'radio\'][name=\'shipping_address\']').on('change', function() 
{
	if (this.name == 'contry_id') jQuery("select[name=\'zone_id\']").val("");
	if (this.name == 'shipping_country_id') jQuery("select[name=\'shipping_zone_id\']").val("");
	
    jQuery(".shipping-method").load('index.php?route=checkout/nicocheckout/shipping_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() 
    {
		if (jQuery("input[name=\'shipping_method\']:first").length) 
		{
			jQuery("input[name=\'shipping_method\']:first").attr('checked', 'checked').prop('checked', true).click();
		} else
		{
			jQuery("#cart_table").load('index.php?route=checkout/nicocheckout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));	
		}
    });

	jQuery(".payment-method").load('index.php?route=checkout/nicocheckout/payment_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() 
	{
		jQuery("[name=\'payment_method\']").removeAttr("checked").prop('checked', false);
	});
});    

$(document).delegate('input[name=\'shipping_method\']', 'click', function() 
{
	if (checkout_shipping_reload_payment > 0)
	{
		jQuery(".payment-method").load('index.php?route=checkout/nicocheckout/payment_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() 
		{
			jQuery("[name=\'payment_method\']").removeAttr("checked").prop('checked', false);
		});
	}

	jQuery("#cart_table").load('index.php?route=checkout/nicocheckout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));
});  

$('body').delegate('[name=\'payment_method\']','click', function() 
{

	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ jQuery('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + jQuery('.checkout_form input[name=\'payment_method\']:checked').prop('title');

	if (!error)
    $.ajax({
        url: 'index.php?route=checkout/nicocheckout/confirm',
        type: 'post',
        data: data,
        success: function(html) 
        {
			jQuery(".payment").html(html);
			<?php if ($checkout_payment_auto_cofirm != 1) {?>
			jQuery("#button-confirm").click();
			<?php } ?>
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$('select[name=\'country_id\']').trigger('change');
jQuery(document).ready(function()
{
	jQuery('input:radio[name=\'payment_method\']:first').attr('checked', true).prop('checked', true);
	<?php /*if ($opencart_version < 2000) {?>
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
	<?php }*/?>
});
//--></script> 

<?php echo $footer;?>
