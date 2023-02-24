require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    context "管理者の場合" do
      let(:role) { FactoryBot.create(:role, name: "管理者") }
      let(:user) { FactoryBot.build(:user, role: role) }

      it "正常に作成できること" do
        expect(user).to be_valid
      end

      it " Eメールが必須であること" do
        user.email = nil
        expect(user).not_to be_valid
      end

      it "パスワードが必須であること" do
        user.password = nil
        expect(user).not_to be_valid
      end

      it "パスワードが6文字以上であること" do
        user.password = "pass"
        expect(user).not_to be_valid
      end
    end

    context "インストラクターまたは一般ユーザーの場合" do
      let(:role) { FactoryBot.create(:role, name: "一般ユーザー") }
      let(:user) { FactoryBot.build(:user, role: role) }

      it "正常に作成できること" do
        expect(user).to be_valid
      end

      it "Eメールが必須であること" do
        user.email = nil
        expect(user).not_to be_valid
      end

      it "パスワードが必須であること" do
        user.password = nil
        expect(user).not_to be_valid
      end

      it "パスワードが6文字以上であること" do
        user.password = "pass"
        expect(user).not_to be_valid
      end
    end
  end
end


