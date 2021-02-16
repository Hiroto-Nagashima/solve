let currentNum = 0
let post_id = 17
let questionAmount = 0
$(function(){
  $('#aboutBtn').on('click', function() {
     post_id = 17

    $.ajax({
      url: '/homes/go',
      dataType : 'json',
    }).done(function (data){
      questionAmount =　$(data).length - 1;
      console.log(data)
      $('#direction').text(data[0]['direction']);

      $('#question_sentense').text(data[0]['question']);

      array = shuffle(["correct_choice","first_wrong_choice","second_wrong_choice"]);
      $.each(array, function(index, val) {
      $('#choices').append("<li question_id =" + data[0]['id']  + " class =" + val + " currentNum =" + currentNum + ">" + data[0][val] +"</li>");
    });

      $('.question_list').removeClass('hidden');

    }).fail(function (data) {
      alert('Bye');
     });
    });


  $('#choices').on('click',"li", function() {
    let question_id = $(this).attr("question_id");
    let choice_class = $(this).attr("class");

    $.ajax({
      url: '/homes/save_choice',
      dataType : 'json',
      type:'POST',
      data : {"post_id" : post_id , "question_id" : question_id ,"choice_class" : choice_class,"currentNum": currentNum}
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
      if(currentNum == questionAmount){
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
      url: '/homes/continue',
      dataType : 'json',
    }).done(function (data){
        currentNum++
        setquiz(data);

    }).fail(function (data) {
      alert('Bye');
    });
      $('#answer').addClass('hidden');

   });


   $('#lastBtn').on('click', function() {
  $.ajax({
      url: '/homes/result',
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
      currentNum = 0
      setquiz(data);

    }).fail(function (data) {
      alert('Bye');
    });
      $('#result').addClass('hidden');
      $('#final-answer').addClass('hidden');

   });

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
      $('#direction').text(data[currentNum]['direction']);

      $('#question_sentense').text(data[currentNum]['question']);

      $('#choices').empty();
      array = shuffle(["correct_choice","first_wrong_choice","second_wrong_choice"]);
      $.each(array, function(index, val) {
      $('#choices').append("<li post_id =" + post_id  + " question_id =" + data[currentNum]['id']  + " class =" + val + ">" + data[currentNum][val] + "</li>");
    });
  }

  const nextBtn =()=>{
    if(currentNum == questionAmount){
          $('#lastBtn').text("Show Score");
        }else{
           $('#nextBtn').text("Next");
        }
    }