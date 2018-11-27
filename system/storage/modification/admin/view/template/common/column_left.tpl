<nav id="column-left">
  <div id="profile">
    <div>
      <?php if ($image) { ?>
      <img src="<?php echo $image; ?>" alt="<?php echo $firstname; ?> <?php echo $lastname; ?>" title="<?php echo $username; ?>" class="img-circle" />
      <?php } else { ?>
      <i class="fa fa-opencart"></i>
      <?php } ?>
    </div>
    <div>
      <h4><?php echo $firstname; ?> <?php echo $lastname; ?></h4>
      <small><?php echo $user_group; ?></small></div>
  </div>
  <ul id="menu">
    <?php foreach ($menus as $menu) { ?>
    <li id="<?php echo $menu['id']; ?>">
      <?php if ($menu['href']) { ?>
      <a href="<?php echo $menu['href']; ?>"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span><?php echo $menu['name']; ?></span></a>
      <?php } else { ?>
      <a class="parent"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span><?php echo $menu['name']; ?></span></a>
      <?php } ?>
      <?php if ($menu['children']) { ?>
      <ul>
        <?php foreach ($menu['children'] as $children_1) { ?>
        <li>
          <?php if ($children_1['href']) { ?>
          <a href="<?php echo $children_1['href']; ?>"><?php echo $children_1['name']; ?></a>
          <?php } else { ?>
          <a class="parent"><?php echo $children_1['name']; ?></a>
          <?php } ?>
          <?php if ($children_1['children']) { ?>
          <ul>
            <?php foreach ($children_1['children'] as $children_2) { ?>
            <li>
              <?php if ($children_2['href']) { ?>
              <a href="<?php echo $children_2['href']; ?>"><?php echo $children_2['name']; ?></a>
              <?php } else { ?>
              <a class="parent"><?php echo $children_2['name']; ?></a>
              <?php } ?>
              <?php if ($children_2['children']) { ?>
              <ul>
                <?php foreach ($children_2['children'] as $children_3) { ?>
                <li><a href="<?php echo $children_3['href']; ?>"><?php echo $children_3['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
      <?php } ?>
    </li>
    <?php } ?>
  </li><?php $opencart_version = (int)str_replace('.','',VERSION); if (!defined('NICO_THEME')) {define('NICO_THEME', 'Nico');} if (!isset($home) || empty($home)) $home = str_replace('?&', '?', preg_replace('@route=[^$&]*@', '',$_SERVER['REQUEST_URI']));?>
  <li id="nicole"><a class="parent" style="background:#104da1;color:#fff;"><i class="fa fa-star fa-fw"></i> <span><?php echo $nico_theme = ucfirst(NICO_THEME);?></span></a>
    <ul>
      <li><a href="<?php echo $home; ?>&amp;route=extension/module/nicocontrolpanel"><?php echo $nico_theme;?> - Control panel</a></li>
      <li><a href="<?php echo $home; ?>&amp;route=<?php if ($opencart_version >= 2300) {?>extension/extension<?php } else { ?>extension/module<?php }?>&amp;nico=true&amp;type=module"><?php echo $nico_theme;?> - Modules</a></li>
      <li><a href="<?php echo $home; ?>&amp;route=<?php if ($opencart_version >= 2300) {?>extension/module<?php } else { ?>module<?php }?>/nicospeedcache/clear_speed_cache">Clear speed cache</a></li>
      <li><a href="<?php echo $home; ?>&amp;route=<?php if ($opencart_version >= 2300) {?>extension/module<?php } else { ?>module<?php }?>/nicospeedcache/clear_opencart_cache">Clear opencart cache</a></li>
      <!-- li><a target="_blank" href="http://<?php echo $nico_theme;?>.nicolette.ro/docs/index.html">Documentation</a></li>
      <li><a target="_blank" href="http://nicolette.ro/faq.html">Theme FAQ</a></li -->
    </ul>
  </li>
  </ul>
  <div id="stats">
    <ul>
      <li>
        <div><?php echo $text_complete_status; ?> <span class="pull-right"><?php echo $complete_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<?php echo $complete_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $complete_status; ?>%"> <span class="sr-only"><?php echo $complete_status; ?>%</span></div>
        </div>
      </li>
      <li>
        <div><?php echo $text_processing_status; ?> <span class="pull-right"><?php echo $processing_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<?php echo $processing_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $processing_status; ?>%"> <span class="sr-only"><?php echo $processing_status; ?>%</span></div>
        </div>
      </li>
      <li>
        <div><?php echo $text_other_status; ?> <span class="pull-right"><?php echo $other_status; ?>%</span></div>
        <div class="progress">
          <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<?php echo $other_status; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $other_status; ?>%"> <span class="sr-only"><?php echo $other_status; ?>%</span></div>
        </div>
      </li>
    </ul>
  </div>
</nav>
