<?php if (!defined('THINK_PATH')) exit();?><script src="js/jquery-1.8.2.min.js"></script>
<div style="height: 43px"></div>
<div id="footer">
    <div class="fnav">
      <ul>
        <li><a href="<?php echo U('Home/Index/index2');?>" ><img src="images/f1s.png" class="img" />首页</a></li>
        <li><a href="<?php echo U('Home/User/index');?>"><img src="images/f2.png" class="img" />我的账户</a></li>
        <li><a href="<?php echo U('Home/User/yaoqing');?>"><img src="images/f3.png" class="img" />邀请<img src="images/xj.gif" class="img2" /></a></li>
        <li><a href="<?php echo C('subscribeurl'); ?>"><img src="images/f4.png" class="img" />关注我们</a></li>
      </ul>
    </div>
  </div>
  
   <div style="display: none"><?php echo C('site_statistics'); ?></div>