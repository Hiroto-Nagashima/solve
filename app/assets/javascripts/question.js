let current_num = 0
let post_id = 0
let questionAmount = 0

function insertQuestion() {
  $('.startBtn').on('click', function() {
    post_id = $(this).data('id');
    $.ajax({
      url: `/questions/go?post_id=${post_id}`,
      dataType : 'json',
    }).done(function (data){
      questionAmount =　$(data).length - 1;
      console.log(data)
      $('#direction').text(data[0]['direction']);

      $('#question_sentense').text(data[0]['question']);

      $('#question_number').text((current_num + 1) + "/" + $(data).length);

      array = shuffle(["correct_choice","first_wrong_choice","second_wrong_choice"]);
      $.each(array, function(index, val) {
        $('#choices').append("<li post_id =" + post_id  + " question_id =" + data[0]['id']  + " class =" + val + " current_num =" + current_num + ">" + data[0][val] +"</li>");
      });
      $('.question_list').removeClass('hidden');
    }).fail(function (data) {
      alert('Bye');
    });
  });

  $('#choices').on('click',"li", function() {
    let post_id = $(this).attr("post_id");
    let question_id = $(this).attr("question_id");
    let choice_class = $(this).attr("class");

    $.ajax({
      url: '/questions/save_choice',
      dataType : 'json',
      type:'POST',
      data : {"post_id" : post_id , "question_id" : question_id ,"choice_class" : choice_class, "current_num": current_num},
    }).done(function (data){
      console.log(data)
      if(data['choice_class'] == 'correct_choice'){
        $('.Correct_or_Wrong').text("正解！！");
        $('.detail').text(data['question']['explanation']);
        nextBtn();

      }else{
        $('.Correct_or_Wrong').text("残念！！");
        $('.correctAnswer').text("正解は" + data['question']['correct_choice'] + "!");
        $('.detail').text(data['question']['explanation']);
        nextBtn();

      }
      if(current_num == questionAmount){
        $('#final-answer').removeClass('hidden');
      }else{
        $('#answer').removeClass('hidden');
      }

    }).fail(function (data) {
      alert('Bye');
    });
  });

  $('#nextBtn').on('click', function() {
    $.ajax({
      url: '/questions/continue',
      dataType : 'json',
    }).done(function (data){
      current_num++
      setquiz(data);
    }).fail(function (data) {
      alert('Bye');
    });
    $('#answer').addClass('hidden');
  });

  $('#lastBtn').on('click', function() {
    $.ajax({
      url: '/questions/result',
      type:'PATCH',
      dataType : 'json',
    }).done(function (data){
      console.log(data)
      let total_question = questionAmount + 1
     $('#total_score').text(data['score'] + "/" + total_question);
    }).fail(function (data) {
      alert('Bye');
    });
    $('#result').removeClass('hidden');
  });

  $('#replayBtn').on('click', function() {
    $.ajax({
      url: '/questions/replay',
      dataType : 'json',
    }).done(function (data){
      current_num = 0
      setquiz(data);
    }).fail(function (data) {
      alert('Bye');
    });
    $('#result').addClass('hidden');
    $('#final-answer').addClass('hidden');
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

  const setquiz =(data)=> {
    $('#direction').text(data[current_num]['direction']);
    $('#question_sentense').text(data[current_num]['question']);
    $('#question_number').text((current_num + 1) + "/" + $(data).length);
    $('#choices').empty();
      array = shuffle(["correct_choice","first_wrong_choice","second_wrong_choice"]);
      $.each(array, function(index, val) {
      $('#choices').append("<li post_id =" + post_id  + " question_id =" + data[current_num]['id']  + " class =" + val + ">" + data[current_num][val] + "</li>");
    });
  }

  const nextBtn =()=>{
    if(current_num == questionAmount){
      $('#lastBtn').text("Show Score");
    }else{
      $('#nextBtn').text("Next");
    }
  }
}

document.addEventListener('turbolinks:load',function() {
  insertQuestion();
})