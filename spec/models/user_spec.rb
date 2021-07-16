require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

    # 入力されている場合のテスト ▼

    it "全ての項目の入力が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nil:false, presence: true のテスト ▼

    it "nicknameがない場合は登録できないこと" do # テストしたいことの内容
      user = build(:user, nickname: "") # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入(今回の場合は意図的にnicknameの値を空に設定)
      user.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
      expect(user.errors[:nickname]).to include("can't be blank") # errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "encrypted_passwordがない場合は登録できないこと" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    
  end
end
