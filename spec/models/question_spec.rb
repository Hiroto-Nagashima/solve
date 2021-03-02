# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な問題の場合は登録されるか" do
      expect(FactoryBot.build(:question)).to be_valid
    end
  end

  context "questionが空白のバリデーションチェック" do
    it "correct_choiceが空白の場合、無効" do
      question = Question.new(correct_choice: '', first_wrong_choice: 'hoge',second_wrong_choice: 'hoge', direction: 'hoge', question: 'hoge')
      expect(question).to be_invalid
    end
    it "first_wrong_choiceが空白の場合,無効" do
      question = Question.new(correct_choice: 'hoge', first_wrong_choice: '',second_wrong_choice: 'hoge', direction: 'hoge', question: 'hoge')
      expect(question).to be_invalid
    end
    it "second_wrong_choiceが空白の場合,無効" do
      question = Question.new(correct_choice: 'hoge', first_wrong_choice: 'hoge',second_wrong_choice: '', direction: 'hoge', question: 'hoge')
      expect(question).to be_invalid
    end
    it "directionが空白の場合,無効" do
      question = Question.new(correct_choice: 'hoge', first_wrong_choice: 'hoge',second_wrong_choice: 'hoge', direction: '', question: 'hoge')
      expect(question).to be_invalid
    end
    it "questionが空白の場合、無効" do
      question = Question.new(correct_choice: 'hoge', first_wrong_choice: 'hoge',second_wrong_choice: 'hoge', direction: 'hoge', question: '')
      expect(question).to be_invalid
    end
  end

end
