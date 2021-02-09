$(function(){
  // $(".comment-list").css("display", "none");

  $('.commentBtn').on('click', function() {
    // $(".commentBtn").not(this).next().slideUp(300);
    // $(this).siblings().slideToggle(300);
    $(".comment-list").toggle(300);
  });
});