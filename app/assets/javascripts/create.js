$(function(){
$("#follow_form").html("<%= j(render(`${users}/${users}/${unfollow}`)) %>");
});