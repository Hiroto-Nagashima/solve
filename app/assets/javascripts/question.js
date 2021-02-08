$(function(){
  $('.startBtn').on('click', function() {
    let post_id = $(this).data('id');

    $.ajax({
      url: `questions/go?post_id=${post_id}`,
      dataType : 'json',
    }).done(function (data){
      $('#direction').text(data[0]['direction']);

      $('#question_sentense').text(data[0]['question']);

      array = shuffle(["correct_choice","first_wrong_choice","second_wrong_choice"]);
      $.each(array, function(index, val) {
      $('#choices').append("<li>" + data[0][val] + "</li>");
    });

      $('.question_list').removeClass('hidden');

    }).fail(function (data) {
      alert('Bye');
    });  });

});

  const shuffle =(arr) => {
    ///最後の要素は合計要素数-1で取得できる
    for(let i = arr.length -1;i>0;i--){
      //0からi番目までの整数値取得
      //0から1までの少数を吐き出すもの(Math.random）に2をかければ1から2までの少数を取り出せる
      const j = Math.floor(Math.random()*(i+1));
      [arr[j], arr[i]] = [arr[i], arr[j]];

    }

    return arr;
  }
