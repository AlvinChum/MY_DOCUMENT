<?php if (!defined('THINK_PATH')) exit();?>
        <div class="formitm">
            <label class="lab">答案集合</label>
            <div class="ipt">
                <textarea name="Fieldset_a" type="text"  class="form-element u-width-large " id="Fieldset_a" value="" rows="3"   ></textarea>
                <p class="help-block">上面问题的答案，多个用逗号隔开</p>
            </div>
        </div>
        <div class="formitm">
            <label class="lab">问题分类</label>
            <div class="ipt">
                <select name="Fieldset_qtype" id="Fieldset_qtype"  class="form-element "><option value="1" <?php if(1 == 2){ ?> selected="selected"  <?php } ?> >java工程师</option><option value="2" <?php if(2 == 2){ ?> selected="selected"  <?php } ?> >php工程师</option><option value="3" <?php if(3 == 2){ ?> selected="selected"  <?php } ?> >web前端</option><option value="4" <?php if(4 == 2){ ?> selected="selected"  <?php } ?> >设计师</option><option value="5" <?php if(5 == 2){ ?> selected="selected"  <?php } ?> >企业HR</option><option value="6" <?php if(6 == 2){ ?> selected="selected"  <?php } ?> >其他职业</option></select>
                <p class="help-block">问题分类，用于确定关注着身份</p>
            </div>
        </div>
        <div class="formitm">
            <label class="lab">问题名称</label>
            <div class="ipt">
                <textarea name="Fieldset_q" type="text"  class="form-element u-width-large " id="Fieldset_q" value="" rows="3"   ></textarea>
                <p class="help-block">填写问题集合，用逗号隔开</p>
            </div>
        </div>