# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create!(
    user_id: '1',
    content: 'nil',
    genre: "その他"
  )

  Question.create!(
    post_id: '1',
    direction: '問題です',
    question: 'このサイトはどーいうサイト?',
    correct_choice: '英語の問題を作って投稿しあえるSNS',
    first_wrong_choice: '写真を投稿し合うSNS',
    second_wrong_choice: '料理を投稿するSNS',
    explanation: 'このサイトで楽しく英語を学んでほしいです！！！'
    )

   Question.create!(
    post_id: '1',
    direction: '問題です',
    question: 'このサイトの名前である"Solve"の意味は？',
    correct_choice: '解く',
    first_wrong_choice: '寝る',
    second_wrong_choice: '食べる',
    explanation: '他のユーザーが作った問題を解いて、空き時間にも勉強できる！'
    )

    Question.create!(
    post_id: '1',
    direction: '問題です',
    question: 'このサイト制作に大きな影響を与えたゲームは？',
    correct_choice: 'マリオメーカー',
    first_wrong_choice: 'モンスターストライク',
    second_wrong_choice: 'ポケモン',
    explanation: '普段問題を解く側の学習者が、逆に問題を作ることで、楽しく英語の知識をアウトプットできる！'
    )

    Question.create!(
    post_id: '1',
    direction: '問題です',
    question: 'このサイトの有効的な活用法は？',
    correct_choice: 'いい問題を作ってくれるユーザーをフォロー',
    first_wrong_choice: 'テレビを見ながら問題を解く',
    second_wrong_choice: '週2回だけ勉強してあとは遊ぶ',
    explanation: '良問作成系Userがあなたの学習を助けてくれます！！'
    )
