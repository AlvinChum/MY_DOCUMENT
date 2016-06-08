<?php
/**
 * 拔河插件回复函数
 * 
 * **/
class tug_plug{
         protected $xuanzezu;
        protected $check;
        protected $from;
        protected $touser;
        protected $bhconf;
          public function __construct($xuanzezu,$check,$request) {

              $this->xuanzezu=$xuanzezu;
              $this->check=$check;
              $this->from=$request['fromusername'];
              $this->touser=$request['tousername'];
              
              $bhconfc=new M('bh_config');
              $this->bhconf=$bhconfc->find();
          }
          public function tug_replay(){
              $from=$this->from;
              $bhconf=$this->bhconf;
			$reply = array(
					new NewsResponseItem('点击进入拔河', $bhconf['rule'], Web_ROOT."/tug/style/images/show.jpg",Web_ROOT."/tug/mobile.php?wecha_id={$from}"),
			);
	            Wechat::$noendtail=0;
	            return $reply;
          }
}

?>