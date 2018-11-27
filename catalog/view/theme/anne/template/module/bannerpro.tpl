<div id="bannerpro<?php echo $module; ?>">
  <?php foreach ($bannerspro as $bannerpro) { ?>
  <div class="item">
    <?php if ($bannerpro['link']) { ?><a href="<?php echo $bannerpro['link']; ?>"><?php } ?>
      <img src="<?php echo $bannerpro['image']; ?>" class="img-responsive" />
      <?php if ($text) { ?>
      <div class="text-bannerpro">
        <div class="text-bannerpro-inner"><?php echo $bannerpro['title']; ?></div>
      </div>
      <?php } ?>
    <?php if ($bannerpro['link']) { ?></a><?php } ?>
  </div>
  <?php } ?>
</div>
<style>
#bannerpro<?php echo $module; ?> .text-bannerpro {
  background: rgba(0, 0, 0, 0.45);
  color: #fff;
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0;
  top: 0;
  opacity: <?php echo $texthover; ?>;
  padding: 10px 40px;
  box-sizing: border-box;
  transition: 0.5s;
  line-height: 1.2;
}
#bannerpro<?php echo $module; ?> .text-bannerpro:hover {
  opacity: 1;
}
#bannerpro<?php echo $module; ?> .text-bannerpro {
  background: <?php echo $banner_bg; ?>;
}
</style>
<script type="text/javascript"><!--
$('#bannerpro<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
  stopOnHover: true,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  navigation: <?php echo $navigation; ?>,
  pagination: <?php echo $pagination; ?>,
	transitionStyle: ($('#bannerpro<?php echo $module; ?> .item').length > 1) ? '<?php echo $animation; ?>' : '',
  baseClass : 'bannerpro',
  theme : ''
});
  $(window).load(function(){
    $('.text-bannerpro').each(function(){
        var paddigTop = ($(this).outerHeight() - ($(this).find('.text-bannerpro-inner').outerHeight() + $(this).find('.text-bannerpro').outerHeight())) / 2;
        $(this).css('padding-top', paddigTop);
      });
  });
--></script>
