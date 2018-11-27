<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;
if (!isset($opencart_version)) $opencart_version = (int)str_replace('.','',VERSION);
$categs = $categories;
$module_name = 'nicogrid';
if ($opencart_version >= 2200) $lang_img_path = 'language/'; else  $lang_img_path = '../image/flags/';

$module_config = array(
	'resize_method'=>array('select', 
					array('resize' => 'Opencart default',
						  'cropresize' => 'Crop and resize',
						  'resizewidth' => 'Width',
						  'resizeheight' => 'Height',
						  'onesize' => 'Onesize',
						  'original' => 'Original size',
						  ),
					'Background image resize method'
				),

	'resize_method_top_image'=>array('select', 
					array('resize' => 'Opencart default',
						  'cropresize' => 'Crop and resize',
						  'resizewidth' => 'Width',
						  'resizeheight' => 'Height',
						  'onesize' => 'Onesize',
						  'original' => 'Original size',
						  ),
					'Image resize method'
				),


	'resize_factor'=>array('input',null,'Resize factor <span class="help">(higher values makes images sharper but increases image size)</span>', 15),

	
	'row_height'=>array('input',null,'Row height', 50),
	'row_height_factor'=>array('input',null,'Row height factor', 10),
	
/*
	'width'=>array('input',null,'Width', 1140),
	'height'=>array('input',null,'Height', 700),

	'medium_width'=>array('input',null,'Medium width', 992),
	'medium_height'=>array('input',null,'Height', 609),

	'small_width'=>array('input',null,'Small width', 768),
	'small_height'=>array('input',null,'Height', 472),

	'extrasmall_width'=>array('input',null,'Extra small width', 480),
	'extrasmall_height'=>array('input',null,'Height', 295),

	'tiny_width'=>array('input',null,'Tiny width', 320),
	'tiny_height'=>array('input',null,'Height', 196),
*/
	'margin_top'=>array('input',null,'Margin top', 5),
	'margin_left'=>array('input',null,'Margin left', 5),

	'section' => array('custom', 'grid', 'Grid'),
);

$grid_element = array(
	'subtitle'=>array('multilanguage',null,'Subtitle', 5),
	'title'=>array('multilanguage',null,'Title', 5),
	'content'=>array('multilanguage_html',null,'Text', 5),
	'button'=>array('multilanguage',null,'Button', 5),
	'url'=>array('multilanguage',null,'Url', 5),
	'img'=>array('image',null,'Image', 5),
	'top_img'=>array('image',null,'Top image', 5),
	
	'top_img_width'=>array('input',null,'Top image width', 5),
	'top_img_height'=>array('input',null,'Top image height', 5),

/*	'image_position'=>array('select', 
					array(
							'top_left' => 'Top right',
							'top_center' => 'Top center',
							'bottom_left' => 'Bottom left',
							'bottom_right' => 'Bottom right',
							'bottom_center' => 'Bottom center',
							'center_center' => 'Center',
						  ),
					'Image position'
				),*/

	'top_img_x'=>array('input','0px','Top image horizontal position <span class="help">(left, right, center or percentage or numeric for px)</span>', 5),
	'top_img_y'=>array('input','0px','Top image vertical position <span class="help">(top, bottom, center or percentage or numeric for px)</span>', 5),
	'top_img_size'=>array('input','0px','Top image size <span class="help">(cover or percentage ex 50%, 100%)</span>', '100%'),

	'text_vertical_align'=>array('select', 
					array(
							'top' => 'Top',
							'middle' => 'Middle',
							'bottom' => 'Bottom',
						  ),
					'Text vertical align'
				),	

	'text_horizontal_align'=>array('select', 
					array(
							'left' => 'Left',
							'center' => 'Center',
							'right' => 'Right',
						  ),
					'Text horizontal align'
				),	

	'text-padding'=>array('input','5','Text padding <span class="help">(pixel value)</span>', 5),
				
	'background_size'=>array('select', 
					array(
							'inherit' => 'Original',
							'contain' => 'Contain',
							'cover' => 'Cover',
						  ),
					'Background size'
				),	
	'background'=>array('colorpicker',null,'Background color', 5),				
);

function grid($module)
{
	global $languages, $module_row, $categs, $_module_row, $opencart_version, $lang_img_path, $grid_element;
	
	if ($module !== true)
	{
		$_module_row = $module_row;
	} else
	{
		$_module_row = '__MODULE_ROW__';
	}
	
	?>
	<p>You can drag and drop and resize the boxes</p>
	
	<div class="nico_grid" row="<?php echo $_module_row;?>">

	    <div class="gridster">
		<ul>
		</ul>
	    </div>

	</div>
	
	<a class="btn btn-primary nico_add_grid_item">Add new grid element</a>
	<input class="grid_data" type="hidden" name="<?php if ($opencart_version > 2000) {?>grid<?php } else {?>nicogrid_module[<?php echo $_module_row;?>][grid]<?php }?>" value="<?php if (isset($module['grid']) && $module['grid']) echo $module['grid'];?>">
	<?php
}

ob_start();
?>

<div class="grid_template" style="display:none">
    <div>
	<!-- select class="grid_element_type">
	    <option value="image">image</option>
	    <option value="color">color</option>
	</select -->
	
	

		<?php 
		foreach ($grid_element as $name => $element) {
		
			$type = $element[0];
			$value = $element[1];
			$text = $element[2];
		?>
		
		<tr>
		<?php
			switch ($type)	
			{
				case'input':
				?>
				<input type="hidden"  data-name="<?php echo $name;?>" value="#<?php echo $name;?>"/>
				<?php
				break;
				case'multilanguage':
				foreach ($languages as $language) {
				if ($opencart_version >= 2200) $lang_image = $lang_img_path . $language['code']  .'/' . $language['code'] . '.png'; else  $lang_image = $lang_img_path . $language['image'];
				?>
				<input type="hidden" data-name="<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>" value="#<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>">
				</td>
				<?php }
				break;
				case'multilanguage_html':
				foreach ($languages as $language) {
				if ($opencart_version >= 2200) $lang_image = $lang_img_path . $language['code']  .'/' . $language['code'] . '.png'; else  $lang_image = $lang_img_path . $language['image'];
				?>
				<input type="hidden" data-name="<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>" value="#<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>">
				</td>
				<?php }
				break;
				case'select':
				?>
				<input type="hidden"  data-name="<?php echo $name;?>" value="#<?php echo $name;?>"/>
				<?php
				break;
				case'colorpicker':
				?>
				<input type="hidden"  data-name="<?php echo $name;?>" value="#<?php echo $name;?>"/>
				<?php
				break;
				case'image':
				?>
				<?php if ($opencart_version > 1564) { ?>


				<!-- a href="#" onclick="window.getSelection().removeAllRanges();" id="thumb-#col-#row-<?php echo $name;?>" class="img-thumbnail" data-toggle="image"  data-original-title="">
					<img src="#<?php echo $name;?>_thumb" data-placeholder="../image/cache/no_image-100x100.png" alt="" title="" id="thumb_#col-#row-<?php echo $name;?>" class="thumb thumb-img" />
				</a -->
				<input type="hidden" data-name="<?php echo $name;?>" class="img"  id="<?php echo $name;?>" value="#<?php echo $name;?>">                
				<input type="hidden" data-name="<?php echo $name;?>_thumb" class="thumb" id="<?php echo $name;?>_thumb" value="#<?php echo $name;?>_thumb">                


				<?php } else { ?>
					
					
				<!-- img id="thumb#col-#row-#<?php echo $name;?>" class="thumb-img" alt="" src="../image/cache/no_image-100x100.jpg" -->
				
				<input type="hidden" data-name="#<?php echo $name;?>" class="img"  id="image#col-#row-<?php echo $name;?>" value="#<?php echo $name;?>">                
				<input type="hidden" data-name="#<?php echo $name;?>_thumb" class="thumb" id="thumb_#col-#row-#<?php echo $name;?>" value="#<?php echo $name;?>_thumb">                
				
				<!-- a onclick="image_upload('#col', '#row','#<?php echo $name;?>');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a onclick="$('#thumb#col-#row-#<?php echo $name;?>').attr('src', '../image/cache/no_image-100x100.jpg'); $('#image#col-#row-#<?php echo $name;?>, #thumb_#col-#row-#<?php echo $name;?>').attr('value', '');">Clear</a -->       
				
				         
				<?php } ?>
				<?php
				break;
			}
		}
		?>
	
	

	<!-- div class="color">
	    <input type="text" class="colorpicker" size=8 value="#clor" color="#clor" style="background-color:#clor"/>
	</div -->

	<a href="#" class="edit_text btn btn btn-primary">edit</a>&nbsp;
    <a href="#" class="remove_grid_element btn btn-danger">remove</a>
    </div>
</div>


  <!-- Modal -->
  <div class="modal" id="gridmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none">
    <div class="modal-dialog">
      <div class="modal-content">
		<div>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Grid item</h4>
        </div>
        <div class="modal-body">

		<table class="table">
		<?php 
		
		foreach ($grid_element as $name => $element) {
		
			$type = $element[0];
			$value = $element[1];
			$text = $element[2];
		?>
		
		<tr>
		<?php
			switch ($type)	
			{
				case'input':
				?>
				<td><label><?php echo $text;?></label></td>
				<td>
				<input type="text"  data-name="<?php echo $name;?>" value="" class="form-control" value=""/>
				</td>
				<?php
				break;
				case'multilanguage':
				foreach ($languages as $language) {
				if ($opencart_version >= 2200) $lang_image = $lang_img_path . $language['code']  .'/' . $language['code'] . '.png'; else  $lang_image = $lang_img_path . $language['image'];
				?>
				<td>
					<label>
					<img src="<?php echo $lang_image;?>" title="<?php echo $language['name']; ?>" />
					<span><?php echo $text;?></span>
					</label>				
				</td>
				<td>
				<input type="text" data-name="<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>" class="form-control">
				</td>
				<?php }
				break;
				case'multilanguage_html':
				foreach ($languages as $language) {
				if ($opencart_version >= 2200) $lang_image = $lang_img_path . $language['code']  .'/' . $language['code'] . '.png'; else  $lang_image = $lang_img_path . $language['image'];
				?>
				<td>
					<label>
					<img src="<?php echo $lang_image;?>" title="<?php echo $language['name']; ?>" />
					<span><?php echo $text;?></span>
					</label>				
				</td>
				<td>
					<textarea class="html form-control" data-name="<?php echo $name;?>_<?php echo str_replace('-', '$',$language['code']); ?>"></textarea>
				</td>
				<?php }
				break;
				case'select':
				?>
				<td><?php echo $text;?></td>
				<td>
					<select data-name="<?php echo $name;?>"  class="form-control">
					<?php foreach($element[1] as $value => $text) {?>
						<option value="<?php echo $value;?>" <?php if ($value == $name) echo "selected=selected";?>><?php echo $text;?></option>
					<?php }?>
					</select>
				</td>
				<?php
				break;
				case'colorpicker':
				?>
				<td><?php echo $text;?></td>
				<td>
				<input type="text"  data-name="<?php echo $name;?>" value="" class="form-control colorpicker" value=""/>
				</td>
				<?php
				break;
				case'image':
				?>
				<td><?php echo $text;?></td>
				<td>

				<?php /* if ($opencart_version > 1564) { ?>
				<a href="#" onclick="window.getSelection().removeAllRanges();" id="<?php echo $name;?>" class="img-thumbnail" data-toggle="image" data-original-title="">
					<img src="../image/cache/no_image-100x100.png" data-placeholder="../image/cache/no_image-100x100.png" alt="" title="" id="<?php echo $name;?>" class="thumb thumb-img" />
				</a>
				<input type="hidden" data-name="<?php echo $name;?>" class="img"  id="<?php echo $name;?>" value="#<?php echo $name;?>">                
				<input type="hidden" data-name="<?php echo $name;?>-thumb" class="thumb" id="<?php echo $name;?>-thumb" value="#<?php echo $name;?>_thumb">                
				<input type="hidden" class="thumb" id="thumb_1-1-image" value="#thumb">                
				<?php } else { ?>
				<img id="thumb1-1-top_image" class="thumb-img" alt="" src="../image/cache/no_image-100x100.jpg">
				<input type="hidden" data-name="top_image" class="img"  id="image1-1-top_image" value="#top_img">                
				<input type="hidden" data-name="top_thumb" class="thumb" id="thumb_1-1-top_image" value="#top_thumb">                
				<a onclick="image_upload('1', '1','top_image');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a onclick="$('#thumb1-1-top_image').attr('src', '../image/cache/no_image-100x100.jpg'); $('#image1-1-top_image, #thumb_1-1-top_').attr('value', '');">Clear</a>                
				<?php } */?>


				<?php if ($opencart_version > 1564) { ?>


				<a href="#" onclick="window.getSelection().removeAllRanges();" id="image-<?php echo $name;?>" class="img-thumbnail" data-toggle="image"  data-original-title="">
					<img src="#<?php echo $name;?>_thumb" data-placeholder="../image/cache/no_image-100x100.png" alt="" title="" id="<?php echo $name;?>_thumb" class="thumb thumb-img" />
				</a>
				<input type="hidden" data-name="<?php echo $name;?>" class="img"  id="input-<?php echo $name;?>" value="#<?php echo $name;?>">                
				<input type="hidden" data-name="<?php echo $name;?>_thumb" class="thumb" id="thumb-<?php echo $name;?>_name" value="#<?php echo $name;?>_thumb">                


				<?php } else { ?>
					
					
				<img id="thumb#col-#row-#<?php echo $name;?>" class="thumb-img" alt="" src="../image/cache/no_image-100x100.jpg">
				
				<input type="hidden" data-name="#<?php echo $name;?>" class="img"  id="image#col-#row-<?php echo $name;?>" value="#<?php echo $name;?>">                
				<input type="hidden" data-name="#<?php echo $name;?>_thumb" class="thumb" id="thumb_#col-#row-#<?php echo $name;?>" value="#<?php echo $name;?>_thumb">                
				
				<a onclick="image_upload('#col', '#row','#<?php echo $name;?>');">Browse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a onclick="$('#thumb#col-#row-#<?php echo $name;?>').attr('src', '../image/cache/no_image-100x100.jpg'); $('#image#col-#row-#<?php echo $name;?>, #thumb_#col-#row-#<?php echo $name;?>').attr('value', '');">Clear</a>       
				
				         
				<?php } ?>
				</td>
				<?php
				break;
			}
		?>
		</tr>
		<?php }?>
		</table>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-close" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->



<link rel="stylesheet" href="view/javascript/jquery/gridster/jquery.gridster.min.css" type="text/css" />
<script src="view/javascript/jquery/gridster/jquery.gridster.min.js"></script>
<script type="text/javascript">
   	  var reg = /^.*image\//i;
      var grid_template = jQuery(".grid_template").html();
      var current_edit_node;
      //var gridster;

      // same object than generated with gridster.serialize() method
      var serialization = [
        {
            col: 1,
            row: 1,
            size_x: 2,
            size_y: 2
        }
      ];
      
      function grid(element, serialization)
      {
	gridster = $(".gridster ul", element).data('gridster'); 
	
	if (typeof gridster == 'undefined' || !gridster)
	{
	    gridster = $(".gridster ul", element).gridster({
	      widget_base_dimensions: [95, 95],
	      widget_margins: [2, 2],
	      min_cols:12,
	      max_cols:12,
	      helper: 'clone',
	      resize: 
	      {
			enabled: true
	      },
	      serialize_params: function ($w, wgd) {
			ser = {};

			ser['id'] = wgd.el[0].id;
			ser['col'] = wgd.col;
			ser['row'] = wgd.row;
			ser['size_y'] = wgd.size_y;
			ser['size_x'] = wgd.size_x;

			jQuery("input[data-name]", $w).each( function ()
			{
				$this = $(this);
				ser[$this.attr('data-name')] = $this.val().replace(reg,'image/');
			});

			return ser;
		/*return {
		    id: wgd.el[0].id,
		    col: wgd.col,
		    row: wgd.row,
		    size_y:wgd.size_y,
		    size_x:wgd.size_x,
		    top_img: $("input[data-name='top_image']",$w).val(),
		    top_thumb: $("input[data-name='top_thumb']",$w).val().replace(reg,'image/'),
		    image_position: $("input[data-name='image_position']",$w).val(),
			background: $("input[data-name='background']",$w).val(),
			top_img_width: $("input[data-name='top_img_width']",$w).val(),
			top_img_height: $("input[data-name='top_img_height']",$w).val(),
		    img: $('.img',$w).val(),
		    thumb: $('img[id^=thumb]',$w).prop("src").replace(reg,'image/'),
		    color: $('.colorpicker',$w).attr('color'),
		    //type: $('.grid_element_type',$w).val(),
		    <?php foreach ($languages as $language) { ?>
			subtitle_<?php echo str_replace('-', '$',$language['code']); ?>:$("input[data-name='subtitle_<?php echo str_replace('-', '$',$language['code']); ?>']",$w).val(),
			title_<?php echo str_replace('-', '$',$language['code']); ?>:$("input[data-name='title_<?php echo str_replace('-', '$',$language['code']); ?>']",$w).val(),
			button_<?php echo str_replace('-', '$',$language['code']); ?>:$("input[data-name='button_<?php echo str_replace('-', '$',$language['code']); ?>']",$w).val(),
			url_<?php echo str_replace('-', '$',$language['code']); ?>:$("input[data-name='url_<?php echo str_replace('-', '$',$language['code']); ?>']",$w).val(),
			<?php } ?>
		};*/
	    }
	    }).data('gridster');
	    
	    if (serialization)
	    {
		//console.dir(serialization);
		//gridster.remove_all_widgets();
		$.each(serialization, function() {
			//this.thumb = this.thumb.replace(reg,'../image/');
		    if (!this.color) this.color = 'rgba(255,255,255,1)';
		    console.log(this);
/*
		    for(variable in this)
		    {
					variable = variable.replace(reg,'../image/');
					//console.log(re,this[variable]);
			}*/

   			<?php if ($opencart_version > 1564) { ?>
		    thumb = '../image/cache/no_image-100x100.png';
		    <?php } else {?>
		    thumb = '../image/cache/no_image-100x100.jpg';
		    <?php } ?>
		    
			widget = grid_template;
			widget = widget.replace(/#row/g, this.row);
			widget = widget.replace(/#col/g, this.col);

		    //backward compat
		    //this.top_img_thumb = this.top_thumb;
		    //this.img_thumb = this.thumb;

			backgrounds = [];
			
			$this = this;
			widget = widget.replace(/"#([^"]+)"/g, function(match, token) {
				if ($this[token])
				{
					str = $this[token].replace(/^image\//g, '../image/');
					if (str.indexOf('image/cache/') > 1 && str.indexOf('no_image') < 1 && backgrounds.indexOf(str) < 0) backgrounds.push(str);
				return '"' + str + '"';  
				}
				else
				return '""';
			});
		    
		    /*for(variable in this)
		    {
					//var re = new RegExp('#'+ variable,"g");
					widget = widget.replace('#'+ variable,this[variable]);
					//console.log(re,this[variable]);
			}*/

/*
top_img
top_thumb
img
thumb
*/
			var re = new RegExp('src="(\s*)"',"g");
			widget = widget.replace(re, 'src="' +  thumb + '"');
		    
		    
		    
		    widget = '<li style="background-image: url(' + backgrounds.join('), url(') + ');background-repeat: no-repeat; background-size: 50% auto; background-position: center center;">' + widget + '</li>';
		    //console.log(widget);
		    
/*		    widget = '<li>' + 
			grid_template.
			    replace(/#row/g, this.row).
			    replace(/#col/g, this.col).
			    //replace(/#clor/g, this.color).
			    replace(/#top_image/g, this.top_img).
			    replace(/#top_thumb/g, this.top_thumb).
			    replace(/#top_img_width/g, this.top_img_width).
			    replace(/#top_img_height/g, this.top_img_height).
			    replace(/#image_position/g, this.image_position).
			    replace(/#background/g, this.background).
			    replace(/#img/g, this.img).
			    replace(/#thumb/g, this.thumb).
			    replace(/#img/g, this.img).
			    replace(/#thumb/g, this.thumb).
			    <?php foreach ($languages as $language) { ?>
			    replace(/#title_<?php echo str_replace('-', '\$',$language['code']); ?>/g, this.title_<?php echo str_replace('-', '$',$language['code']); ?>).
			    replace(/#subtitle_<?php echo str_replace('-', '\$',$language['code']); ?>/g, this.subtitle_<?php echo str_replace('-', '$',$language['code']); ?>).
			    replace(/#button_<?php echo str_replace('-', '\$',$language['code']); ?>/g, this.button_<?php echo str_replace('-', '$',$language['code']); ?>).
			    replace(/#url_<?php echo str_replace('-', '\$',$language['code']); ?>/g, this.url_<?php echo str_replace('-', '$',$language['code']); ?>).
			    <?php } ?>
				<?php if ($opencart_version > 1564) { ?>
			    replace(/src=".*\/image\/cache\/no_image-100x100.png/g, 'src="' + this.thumb) 
				<?php } else {?>
			    replace(/src=".*\/image\/cache\/no_image-100x100.jpg/g, 'src="' + this.thumb)
				<?php } ?>
			+ '</li>';*/
		    
		    		    
		    li = gridster.add_widget(widget, 
			this.size_x, this.size_y, this.col, this.row);
			
			jQuery('select', li).val(this.type);
			//jQuery('> div > div', li).hide();
			jQuery('> div > div.' + this.type, li).show();
			if (this.background && this.background != 'undefined') li.css('background-color',this.background);
		});
	    }
	} 
	
	return gridster;
      }

    

      $(function(){
	
		$.each(jQuery('.grid_data'), function() 
		{
			if (this.value) grid(jQuery('.nico_grid', this.parentNode), JSON.parse(this.value));    
		});


	    jQuery("body").delegate(".nico_add_grid_item", "click", function() 
	    {
			gridster = grid(jQuery('.nico_grid', this.parentNode));
			
			gridster.add_widget.apply(gridster,  ['<li>' + grid_template.replace(/#row/g, Math.floor(Math.random() * 1000)).replace(/#col/g, Math.floor(Math.random() * 1000)) + '</li>', 1, 2]);
	    });
	    
	    jQuery(".gridster").delegate('.remove_grid_element', "click", function(e) 
	    {
			gridster.remove_widget(this.parentNode.parentNode);
			return false;
	    });
	    
	    
      });
      
      
      function grid_modal(action)
      {
		  if (action == "show")
		  {
			jQuery("#gridmodal").show();  
		  } else
		  {
			jQuery("#gridmodal").hide();
		  }
	  }
			  
	
		
		jQuery("body").delegate("#gridmodal .btn-primary", "click", function(e) 
		{
			jQuery("#gridmodal input,#gridmodal select, #gridmodal textarea").each(function () 
			{
				console.log('[data-name=\'' + jQuery(this).attr('data-name') + '\'] = ' + this.value);
				console.log(jQuery('[data-name=\'' + jQuery(this).attr('data-name') + '\']', current_edit_node));
				jQuery('[data-name=\'' + jQuery(this).attr('data-name') + '\']', current_edit_node).val(this.value);
			});
			
			backgrounds = [];
			jQuery("#gridmodal .thumb-img").each(function () 
			{
				src = jQuery(this).attr("src");
				if (src.indexOf('no_image') < 1) {
					backgrounds.push(src);
					jQuery('input[data-name=\'' + this.id + '\']', current_edit_node).val(src);
				}
				
			});
			
			jQuery(current_edit_node.parentNode).css({'background-image':'url(' + backgrounds.join('), url(') + ')', 'background-color':jQuery("#gridmodal input[data-name='background']").val()});
			grid_modal("hide");
			//$("#gridmodal" ).modal( "hide" );
		});
		
		jQuery("body").delegate("#gridmodal .close, #gridmodal .btn-close", "click", function(e) 
		{
			grid_modal("hide");
			//$("#gridmodal" ).modal( "hide" );
		});
		
		jQuery("body").delegate(".edit_text", "click", function(e) 
		{
			current_edit_node = this.parentNode;
			jQuery("#gridmodal input, #gridmodal select,#gridmodal textarea").each(function () 
			{
				var d = new Date();
				value = jQuery('[data-name=\'' + jQuery(this).attr('data-name') + '\']', current_edit_node).val();
				value = (value != 'undefined')?value:'';
				if (value[0] == '#') value = ' ';
				jQuery(this).val(value);
			});
			
			jQuery("#gridmodal .thumb-img").each(function () 
			{
				jQuery(this).attr("src", jQuery("#" + this.id, current_edit_node).val());
				console.log(jQuery("#" + this.id, current_edit_node).val());
			});

/*			top_thumb = jQuery('input[data-name=\'top_thumb\']', current_edit_node).val();
			if (!top_thumb || top_thumb == 'undefined' || top_thumb == '#top_thumb') top_thumb = '../image/cache/no_image-100x100.<?php if ($opencart_version > 1564) { ?>png<?php } else {?>jpg<?php }?>';
			jQuery("#gridmodal td > img[id^=thumb], #gridmodal td > a > img[id^=thumb]").attr("src", top_thumb.replace(reg,'../image/'));
*/
			grid_modal("show");
			<?php if ($opencart_version > 1564) { ?>
			//$("#gridmodal" ).modal( "show" );
			<?php } else {?>
			//$("#dialog-form" ).dialog( "open" );
			<?php }?>				
			
			e.preventDefault();
			return false;
		});      

    function before_save()
    {
	
	$(".nico_grid").each(function() 
	{
	    row = jQuery(this).attr("row");
	    var gridster = $(".gridster ul", this).gridster().data('gridster');
	    gridData = gridster.serialize();

	    function sort_grid(a, b){
	      if (a.row > b.row)
		return 1;
	      else if (a.row < b.row)
		return -1;
	      else if (a.col > b.col)
		return 1;
	      else if (a.col < b.col)
		return -1;
	    }
	    
	    gridData.sort(sort_grid);
	    console.dir(gridData);
	    jQuery('<?php if ($opencart_version > 2000) {?>[name="grid"]<?php } else {?>[name="nicogrid_module[' + row + '][grid]"]<?php }?>').val(JSON.stringify(gridData));
	});

	$('#form').submit();
	return false;
    }	      
    </script>
    
    
    
<style>
.gridster, .gridster ul {
    margin: 0;
    padding: 0;
}
ul {
    list-style-type: none;
}
.controls {
    margin-bottom: 20px;
}
.gridster ul {
    background-color: #EFEFEF;
}
.gridster li {
    font-size: 1em;
    font-weight: bold;
    line-height: 100%;
    text-align: center;
    

   background-position: center center;
    background-repeat: no-repeat;
    background-size: contain;    
}

.gridster {
    margin: 0 auto;
    opacity: 0.8;
    transition: opacity 0.6s ease 0s;
}
.gridster .gs-w {
    background-color:#fff;
    cursor: pointer;
}

.gridster li a
{
	margin-top:3px;
	font-size:11px;
	display:inline-block;
}
		
.gridster li .image img
{
	display:block;
	margin:0px auto;
	max-width:90%;
}
.gridster li .image
{
	border:none;
	display:block;
	padding:0px 0px 2px;
}


.gridster .player {
    background: none repeat scroll 0 0 #BBBBBB;
}
.gridster .preview-holder {
    background: none repeat scroll 0 0 #FF0000 !important;
    border: medium none !important;
}

.gs-w > div
{
    padding:5px 0px;
}

.gs-w > div > .color
{
    display:none;
}

.nico_grid 
{
  background: #fafafa;
  padding:10px;
}

.btn {
    -moz-user-select: none;
    background-image: none;
    border: 1px solid rgba(0, 0, 0, 0);
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.42857;
    margin-bottom: 0;
    padding: 6px 12px;
    text-align: center;
    vertical-align: middle;
    border: medium none;
    border-radius: 4px;
    font-size: 12px;
    text-decoration:none;
}    

.btn-primary  
{
    background-color: #7ABCE7;
    border-bottom: 1px solid #3498DB;
    text-shadow: 0 -1px #3498DB;
    color: #FFFFFF;
}

.img-thumbnail
{
	max-width:90%;
}

.top_img
{
	position:absolute;
	top:0px;
}

#gridmodal
{
	width:100%;
	height:100%;
	position:absolute;
	position:fixed;
	background:#fff;
	background:rgba(255,255,255,0.7);
	top:0px;
	left:0px;
	display:table;
	text-align:center;
    opacity:1;
}

#gridmodal .modal-dialog
{
	display:table-row;
	vertical-align:middle;
	text-align:center;
}

#gridmodal .modal-content
{
	display:table-cell;
	vertical-align:middle;
	text-align:center;
	background:transparent;
	 box-shadow: none;
}

#gridmodal .modal-content > div
{
	text-align:left;
	width:500px;
	margin:0px auto;
	background:#fff;
	padding:0px 20px 30px;
	border:2px solid #ccc;
}

#gridmodal .modal-content > div .modal-footer
{
	text-align:right;
}

#gridmodal .modal-content > div .close
{
	float:right;
	background:#eee;
	border:none;
}


#gridmodal .modal-content > div table
{
	width:100%;
}

#gridmodal .modal-content > div td > img
{
	display:block;
}

.ui-dialog-buttonset, .ui-dialog-titlebar
{
	text-align:right;
}

.ui-dialog-titlebar > span
{
	float:left;
	margin:5px 10px;
}

.ui-button
{
	margin:5px 10px;
	padding:5px 10px;
}

.ui-dialog-content td
{
	padding:5px;
}

.ui-widget-overlay
{
	background:rgba(255,255,255, 0.7);
    display: block;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 0;	
}

.ui-dialog
{
	background:#eee;
	border:2px solid #ccc;
}

.ui-dialog-content
{
	background:#fff;
}
.modal-body{
    max-height: calc(100vh - 200px);
    overflow-y: auto;
}
</style>    
<?php
$module_js = ob_get_contents();
ob_end_clean();

if ($opencart_version >= 2010) 
{
	require('nicomodule2010.tpl');
} else
if ($opencart_version >= 2000) 
{
	require('nicomodule2.tpl');
} else
{
	require('nicomodule.tpl');
}
