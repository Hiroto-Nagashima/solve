$(function(){
  $(".comment-list").css("display", "none");

  $('.commentBtn').on('click', function() {
    // $(".commentBtn").not(this).next().slideUp(300);
    // $(this).siblings().slideToggle(300);
    let post_id = $(this).data('id');
    $(".comment-list_"+post_id).slideToggle(300);
  });
});