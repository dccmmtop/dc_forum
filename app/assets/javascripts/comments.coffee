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
    comment_id = like.parent().parent().find(".comment_id").text()
    $.ajax 
      type: 'GET'
      url: '/comments/'+comment_id+'/edit'
      success: (data) ->
        like.text(data + "个赞")
        like.css("color","red")
        return true
       