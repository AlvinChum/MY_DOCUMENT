<?php include('navigation.php');
 ?>
<link href="../files/css/semantic.min.css" media="all" rel="stylesheet" type="text/css" />
      <div class="container main-content">
        <!-- DataTables Example -->
        <div class="row">
          <div class="col-lg-12">
              
            <div class="widget-container fluid-height clearfix">
              <div class="heading">
                <i class="se7en-flag"></i>　拔河管理
                <div class="pull-right" >
                    <a class="btn btn-success" href="../tug/index.php" target="_black">进入前台</a>
                </div>
              </div>
      <div class="widget-content padded form-horizontal">
          <div class="form-group">
            <label class="control-label col-md-2">拔河配置参数管理:</label>
            <div class="col-md-3">
                <a class="btn btn-block btn-primary" href="tugconf.php">修改配置</a></span>
                 </div>
               
            </div>      
            <div class="form-group">
            <label class="control-label col-md-2">拔河初始化:</label>
                <div class="col-md-3">
            	<button class="btn btn btn-block btn-danger" onclick="location='tug.do.php?do=ready'" data-original-title="清空所有拔河用户信息，请用拔河中奖信息，重置游戏！" data-toggle="tooltip" id="tooltip-top">重置游戏（初始化）</button>

          </div> 
            </div>
            <div class="alert alert-warning">
                <button class="close" data-dismiss="alert" type="button">×</button>
                memcache用于处理用户高频查询操作，200人以上的活动建议开启。</div>
            <div class="form-group">
            <label class="control-label col-md-2">memcache状态:</label>
                <div class="col-md-3">
                    <?php
//实例化一个memcache对象
if(!empty($_SERVER['HTTP_APPNAME'])){
    @$mem=memcache_init();

}else if(class_exists("Memcache")){
    if(class_exists("Alibaba")){
    @$mem=Alibaba::cache();
    }else{
		@$mem=new Memcache;
		@$mem->connect('localhost','11211');
    }
}
if($mem){
    $mem->set('test','1');
    if(@$mem->get('test')){
        echo '<div style="color:green;font-size:19px;line-height:30px">
                        <i class="icon-ok"></i>
                        开启状态
                        </div>';
    }
}else{          

    echo '<div style="color:red;font-size:20px;font-size:19px;line-height:30px">
                    <i class="icon-remove"></i>
                    关闭状态
                    </div>';
}
?>
                    
                    
                </div> 
            </div>

          </div>

          </div>
          </div>
          </div>
        <div class="row">
          <div class="col-lg-12">
              
            <div class="widget-container fluid-height clearfix">
              <div class="heading">
                <i class="se7en-flag"></i>　拔河中奖管理
              </div>
      <div class="widget-content padded form-horizontal">
            <table class="table table-striped"  id="datatable-editable">
                  <thead>
                    <tr><th class="hidden-xs">
                      序号
                    </th>
                    <th>
                      昵称
                    </th>
                    <th>
                      队列
                    </th>
                    <th>
                      中奖时间
                    </th>
                    <th class="hidden-xs">
                      状态
                    </th>
                    <th>
                      发奖时间
                    </th>
                    <th>
                      操作
                    </th>
                  </tr></thead>
                  <tbody>
                    <?php
					 include('biaoqing.php');
					 $zjc=new M('zjlist');
					 $zjusers=$zjc->select("fromplug='tug'");
					 $bhconfc=new M('bh_config');
					 $bhconf=$bhconfc->find();
					 foreach($zjusers as $q){
					     $userinfo= unserialize($q['info']);
					     $userinfo['uname']=pack('H*',$userinfo['uname']);
					    $userinfo=emoji_unified_to_html(emoji_softbank_to_unified($userinfo));
					     ?>
                    <tr>
                      <td class="hidden-xs">
                        <?=$q['id']?>
                      </td>
                      <td>
                        <img class="ui avatar image" src="<?=$userinfo['pic']?>"><?=$userinfo['uname']?>
                      </td>
                      <td>
                        <?=$userinfo['whoteam']==1?$bhconf['teama']:$bhconf['teamb']?>
                      </td>
                      <td>
                        <?=date('Y-m-d H:i',$q['zjdatetime'])?>
                      </td>
                      <td class="hidden-xs">
                      <?php 
					  	if ($q['status']){
							echo '<span class="label label-success">已发</span>';
							}else{
							echo '<span class="label label-warning">待办</span>';
								}
					  ?>
                      </td>
                      <td>
                        <?php
                        if($q['fjdatetime']==0){echo '暂无';}else{
                        echo date('Y-m-d H:i',$q['fjdatetime']);}?>
                      </td>
                      <td>
                      <?php 
					  	if ($q['status']){
							echo '发奖';
							}else{
							echo '<a href="tug.do.php?do=zj_fj&cid='.$q['id'].'">发奖</a>';
								}
					  ?>
                      </td>
                      
                    </tr>
					     
                     <?php }?>
                    
                  </tbody>
                </table>
                </div>
          </div>
          </div>
          </div>
         
      </div>  </div>
          </div>
        </div>
        <!-- end DataTables Example -->
  </div>
</div>
    </div>
  </body>

</html>