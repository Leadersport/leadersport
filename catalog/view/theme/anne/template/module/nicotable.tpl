<!--cols:<?php if ($grid_cols) echo $grid_cols + $grid_offset;else echo 12;?>   -->
<div class="<?php if ($table_responsive) {?>table-responsive <?php } if (isset($hide_on_mobile) && $hide_on_mobile == 'true') {?> hide_on_mobile<?php }?>" id="<?php echo $module_id;?>">

<?php if ($table_responsive) {?><div class="table-responsive"><?php }?>

<table class="table <?php if ($table_striped) echo ' table-striped';if ($table_hover) echo ' table-hover';if ($table_bordered) echo ' table-bordered';if ($table_inverse) echo ' table-inverse';if ($table_reflow) echo ' table-reflow';?>">
<?php
$first_row = true;
foreach ($table as $rows)
{
?>
	<tr>
		<?php
		foreach ($rows as $cell)
		{
		
		if ($table_header && $first_row) {
		?>
		<th><?php echo $cell;?></th>
		<?php } else 
		{ ?>
		<td><?php echo $cell;?></td>
		<?php
		} 

		}?>
	</tr>
<?php
$first_row = false;
} 
?>
</table>		
</div>
