$(function(){
  $('.startBtn').on('click', function() {
    // 入力された都市名でWebAPIに天気情報をリクエスト
    $.ajax({
      url: 'questions/go?'
      dataType : 'jsonp',
    }).done(function (data){
      //通信成功
    }).fail(function (data) {
      //通信失敗
    });  });
});
