require 'rails_helper'

RSpec.describe "User", type: :model do
  describe "ユーザーが管理者バリデーションのテスト" do
    let!(:user) { FactoryBot.create(:admin_user) }

    context "新規作成する場合" do
      it "正常に作成できること" do
        expect(user).to be_valid
      end
    end

    context "Eメールが空の場合" do
      it " Eメールが必須であること" do
        user.email = nil
        expect(user).not_to be_valid
      end
    end

    context "パスワードが空の場合" do
      it "パスワードが必須であること" do
        user.password = nil
        expect(user).not_to be_valid
      end
    end

    context "パスワードが６文字以下の場合" do
      it "パスワードが6文字以上であること" do
        user.password = "pass"
        expect(user).not_to be_valid
      end
    end
  end

  describe "一般ユーザーの場合" do
    let!(:user) { FactoryBot.create(:general_user) }

    context "新規作成の場合" do
      it "正常に作成できること" do
        expect(user).to be_valid
      end
    end

    context "Eメールが空の場合" do
      it "Eメールが必須であること" do
        user.email = nil
        expect(user).not_to be_valid
      end
    end

    context "パスワード空の場合" do
      it "パスワードが必須であること" do
        user.password = nil
        expect(user).not_to be_valid
      end
    end

    context "パスワードが６文字以下の場合" do
      it "パスワードが6文字以上であること" do
        user.password = "pass"
        expect(user).not_to be_valid
      end
    end
  end
end


