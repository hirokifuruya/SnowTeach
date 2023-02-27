require 'rails_helper'

RSpec.describe Recruit, type: :model do
  describe "投稿のバリデーションのテスト" do
      let(:recruit) { FactoryBot.create(:recruit) }

    context "投稿する場合" do
      it "正常に作成できること" do
        expect(recruit).to be_valid
      end
    end
    context "名前が空である場合" do
      it "名前が必須であること" do
        recruit.name = nil
        expect(recruit).not_to be_valid
      end
    end

      context "詳細が空である場合" do
      it "詳細が必須であること" do
        recruit.detail = nil
        expect(recruit).not_to be_valid
      end
    end
  end
end
