require 'rails_helper'

RSpec.describe Recruit, type: :model do
  describe "バリデーション" do
    let(:recruit) { build(:recruit) }

    it "正常に作成できること" do
      expect(recruit).to be_valid
    end

    it "名前が必須であること" do
      recruit.name = nil
      expect(recruit).not_to be_valid
    end

    it "詳細が必須であること" do
      recruit.detail = nil
      expect(recruit).not_to be_valid
    end
  end
end
