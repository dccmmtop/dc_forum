# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".clear").on 'mouseover', ->
    $(this).find(".reply-ta").show();
  
  $(".clear").on 'mouseleave', ->
    $(this).find(".reply-ta").hide();
  
  $(".reply-ta").on 'click', ->
    $(".reply-er").empty();
    $(".reply-er").append('<span class="to"></span>');
    $(".reply-er .to").before( '<i class="fa fa-reply" aria-hidden="true" title="回复"></i>');
    $(".reply-er .to").text(" "+$(this).parent().siblings('span.name').text() + " ");
    $(".reply-er .to").after('<i class= "fa fa-close" style="color:#B0C4DE"></i>');
    $(".fa-close").click ->
      $(".reply-er").empty();
    $("#comment_to_comment_id").val($(this).parent().siblings("i.comment_id").text());
    $(".comment-content").focus();

  $(".fa-heart").click -> 
    like = $(this)
    comment_id = like.parent().parent().find(".comment_id").text();
    user_id = like.parent().parent().find(".user_id").text();
    
    if(user_id.length == 0)
     alert("请你登录!");
     return false;
     end
    $.ajax 
      type: 'GET'
      url: '/likes/like_or_dont_like'
      data:{comment_id:comment_id,user_id:user_id}
      success: (data) ->
        result = data.split("-")
        if(result[0] == 'cancel')
          like.css("color","gray");
        else if(result[0] == 'add')
          like.css("color","red");
        if(data.split("-")[1] != '0')
          like.text(data.split("-")[1] + "个赞");
        else
          like.text("");
        return true;
       