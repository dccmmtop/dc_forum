## rails_ajax 验证验证码

#### view

```ruby
    <div class="form-group ">
            <%= rucaptcha_input_tag( class:'captcha-text',placeholder: '输入验证码') %>
            <%= rucaptcha_image_tag(class:'image-box', alt: 'Captcha') %>
            <%= image_tag("wrong.png",class:'wrong')%>
      </div>
```

css  验证码输入错误时,显示出错误的图片(默认不显示)

```css
<style type="text/css">
    .wrong{
        width: 22px;
        height: 22px;
        margin-left: -160px;
        display: none;
    }
</style>>
```

JS


```erb
<script type="text/javascript">
    function change_captcha(){
        var src=$(".image-box").attr("src");
        $(".image-box").attr("src",src.split("?")[0]+"?"+(new Date().getTime()))
    }
    $(".image-box").click(function(){
        change_captcha();
        $(".wrong").hide();
        $(".captcha-text").attr(value,"");
    })
   // 监听文本框字数变化
    $(".captcha-text").on('keyup', function(event) {
        var content=$(".captcha-text").val();
        var length=content.length
        // 验证码为4位
        if (length==4){
         $.ajax({
          type:"GET",
          url:"/users/verify_rucaptcha",//验证验证码的action
          //使用rucaptcha插件时,传送验证的params的名称是_rucaptcha
           data: {_rucaptcha: content}
           success:function(result){
              if(result=="false")
              {
                //验证码错误时,显示错误提示
                $(".wrong").show();
            }
            return ;
        }
    })
     }
 });

</script>
```

controller

```ruby
 def verify_rucaptcha
    if verify_rucaptcha?(params[:_rucaptcha])
      # 不渲染视图,只返回信息
      render  plain: "true"
    else 
      render  plain: "false"
    end
  end
```

