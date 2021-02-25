function setCommentSetting()
{
  $(".comment-list").css("display", "none");

  $('.commentBtn').on('click', function() {
    let post_id = $(this).data('id');
    $(".comment-list_"+post_id).slideToggle(300);
  });
}

document.addEventListener('turbolinks:load', setCommentSetting);

