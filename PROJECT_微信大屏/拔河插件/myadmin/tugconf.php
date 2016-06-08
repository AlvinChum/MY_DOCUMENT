<?php include('navigation.php');
 ?>
 <link href="../files/css/semantic.min.css" rel="stylesheet" type="text/css" />
<div class="container main-content">
        <!-- DataTables Example -->
        <div class="row">
          <div class="col-lg-12">
              
            <div class="widget-container fluid-height clearfix">
              <div class="heading">
                <i class="se7en-flag"></i>　拔河参数配置
              </div>
      <div class="widget-content padded form-horizontal">
          <form action="tug.do.php?do=conf" enctype="multipart/form-data" method="post">
              <?php 
                $texttitle=array(
                    "活动标题",
                    "活动游戏时长",
                    "摇动幅度（默认1000）",
                    "活动规则",
                    "页脚版权",
                    );
                $bh_confc=new M('bh_config');
                $bhconf=$bh_confc->find();
                $bhconftext=$bh_confc->find('id=1',"title,timelimit,threshold,rule,footer");
                $i=0;
                foreach($bhconftext as $k=>$v){
                    echo '<div class="form-group">
                    <label class="control-label col-md-2">'.$texttitle[$i].'</label>
                    <div class="col-md-7">
                      <input class="form-control" value="'.$v.'" name="'.$k.'" type="text">
                    </div>
                </div>';
                $i++;
                }
              ?>
            <div class="form-group">
            <label class="control-label col-md-2">摇动类型</label>
            <div class="col-md-7">
                <?php 
                $options=array('','左右摇动','上下摇动','随便摇动');
                    for($i=1;$i<=3;$i++){
                        if($bhconf['shaketype']==$i){
                            $typecheck="checked";
                        }else{
                            $typecheck="";
                        }
                        echo '<label class="radio-inline"><input name="shaketype" '.$typecheck.' type="radio" value="'.$i.'"><span>'.$options[$i].'</span></label>';
                    }
                 ?>
              
            </div>
          </div>
            <div class="form-group">
            <label class="control-label col-md-2">中奖记录类别</label>
            <div class="col-md-7">
                <?php 
                $options=array('','获胜方','全部');
                    for($i=1;$i<=2;$i++){
                        if($bhconf['zjtype']==$i){
                            $typecheck="checked";
                        }else{
                            $typecheck="";
                        }
                        echo '<label class="radio-inline"><input name="zjtype" '.$typecheck.' type="radio" value="'.$i.'"><span>'.$options[$i].'</span></label>';
                    }
                 ?>
              
            </div>
          </div>
            <div class="form-group">
            <label class="control-label col-md-2">中奖记录人数</label>
            <div class="col-md-7">
                
              <select class="form-control" name="zjpersonnum">
                  <?php
                  for($i=0;$i<=12;$i++){
                      if($i==0){
                          echo '<option value="'.$bhconf['zjpersonnum'].'">当前是【'.$bhconf['zjpersonnum'].'】</option>';
                      }else{
                        echo '<option value="'.$i.'">'.$i.'</option>';
                      }
                  }
              
                ?>
              </select>
            
            </div>
          </div>
            <div class="form-group">
            <label class="control-label col-md-2">排除已经中奖的用户</label>
            <div class="col-md-7">
                <?php 
                $options=array('不排除','排除');
                    for($i=0;$i<=1;$i++){
                        if($bhconf['zjpaichu']==$i){
                            $typecheck="checked";
                        }else{
                            $typecheck="";
                        }
                        echo '<label class="radio-inline"><input name="zjpaichu" '.$typecheck.' type="radio" value="'.$i.'"><span>'.$options[$i].'</span></label>';
                    }
                 ?>
              
            </div>
          </div>
          <div class="row">
              <div class="col-lg-12">
                  <div class="col-md-6 ">
                      <div class="ui segment">
                      <div class="heading">
                        队伍一
                        </div>
                        <div class="widget-content ">
                            
                        <div class="form-group">
                        <label class="control-label col-md-2">队伍名称</label>
                        <div class="col-md-7">
                          <input class="form-control" value="<?=$bhconf['teama']?>" name="teama" type="text">
                        </div>
                        </div>    
                    
                        <div class="form-group">
                    <label class="control-label col-md-2">队伍图片</label>
                    <div class="col-md-4">
                      <div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
                        <div class="fileupload-new img-thumbnail" style="width: 200px; height: 150px;">
                          <img src="<?=$bhconf['teamapic']?>">
                        </div>
                        <div class="fileupload-preview fileupload-exists img-thumbnail" style="width: 200px; max-height: 150px;"></div>
                        <div>
                          <span class="btn btn-default btn-file"><span class="fileupload-new">选择图片</span><span class="fileupload-exists">重新选择</span><input type="file" name="teamapic"></span><a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">删除</a>
                        </div>
                      </div>
                    </div>
                  </div>
                    
                        </div></div>
                      </div>
                  <div class="col-md-6">
                      <div class=" ui segment">
                      <div class="heading">
                        队伍二
                        </div>
                        <div class="widget-content ">
                            
                        <div class="form-group">
                        <label class="control-label col-md-2">队伍名称</label>
                        <div class="col-md-7">
                          <input class="form-control" value="<?=$bhconf['teamb']?>" name="teamb" type="text">
                        </div>
                        </div>    
                    
                        <div class="form-group">
                    <label class="control-label col-md-2">队伍图片</label>
                    <div class="col-md-4">
                      <div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
                        <div class="fileupload-new img-thumbnail" style="width: 200px; height: 150px;">
                          <img src="<?=$bhconf['teambpic']?>">
                        </div>
                        <div class="fileupload-preview fileupload-exists img-thumbnail" style="width: 200px; max-height: 150px;"></div>
                        <div>
                          <span class="btn btn-default btn-file"><span class="fileupload-new">选择图片</span><span class="fileupload-exists">重新选择</span><input type="file" name="teambpic"></span><a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">删除</a>
                        </div>
                      </div>
                    </div>
                  </div>
                    
                        </div>
                        </div>
                      </div>

                  
              </div>
          </div>
          <div class="row">
              <div class="col-lg-12">
                  <div class="ui segment">
                      <div class="heading">
                          赞助商图片
                      </div>
                      <div class="alert alert-warning">
                          以下为赞助商图片上传区域，如需更改请一次全部更改，可以只添加一个或两个赞助商。
                          <p style="color:red">请上传尺寸为1:1，且不大于300kb的图片</p>
                      </div>
                      <?php 
                      $ads=unserialize($bhconf['ads']);
                        for($i=0;$i<4;$i++){
                            echo '<div class="form-group"><label class="control-label col-md-2">赞助商'.($i+1).'</label>
            <div class="col-md-4">
              <div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden" >
                <div class="input-group">
                  <div class="form-control" style="overflow: hidden;line-height: 23px;">
                    <i class="icon-file fileupload-exists"></i><span class="fileupload-preview" >'.$ads[$i].'</span>
                  </div>
                  <div class="input-group-btn">
                    <a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">删除</a><span class="btn btn-default btn-file"><span class="fileupload-new">选择</span><span class="fileupload-exists">更改</span><input type="file" name="ad'.$i.'"></span>
                  </div>
                </div>
              </div>
            </div>
            </div>';
                        }
                      ?>
            
          
          </div>
              </div>
          </div>
            
        <div class="row"><div class="padded pull-right"><input class="btn btn-primary" type="submit" value="提交修改"></div></div>
          </form>
                
          
          </div>
                  </div>
              </div>
          </div>
         
</div> 
      
      
      </div>
          </div>
        </div>
        <!-- end DataTables Example -->
  </div>
</div>
    </div>
  </body>

</html>