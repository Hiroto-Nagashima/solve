# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効なユーザーの場合は登録されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(name: '', email: 'hoge',password: 'hoge')
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(name: 'hoge', email: '',password: 'hoge')
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(name: 'hoge', email: 'hoge',password: '')
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  context "入力された字数チェック" do
    it "nameが31字以上なら無効" do
      expect(FactoryBot.build(:user_wrong_name)).to be_invalid
    end
    it "passwordが5文字以下なら無効" do
      expect(FactoryBot.build(:user_wrong_password)).to be_invalid
    end
    it "introductionが301文字以上なら無効" do
      expect(FactoryBot.build(:user_wrong_introduction)).to be_invalid
    end
  end

end
