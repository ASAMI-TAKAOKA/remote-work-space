require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
  end

  # factory_botが有効かどうかを検査。
  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end
  it "has a valid factory of another_user" do
    user = @another_user
    expect(user).to be_valid
  end

  # スポット名称、私のイチオシポイント、住所、user_idが入力されていれば有効。
  it "is valid with text, body, address and user_id" do
    user = FactoryBot.create(:user)
    post = user.posts.build(
      text: "スポット名称",
      body: "私のイチオシポイント",
      address: "住所",
      user_id: 1
      )
    expect(post).to be_valid
  end

  # スポット名称がなければ無効。
  it "is invalid without text" do
    post = Post.new(text: nil)
    post.valid?
    expect(post.errors[:text]).to include("can't be blank")
  end

  # 私のイチオシポイントがなければ無効。
  it "is invalid without body" do
    post = Post.new(body: nil)
    post.valid?
    expect(post.errors[:body]).to include("can't be blank")      
  end

  # 住所がなければ無効。
  it "is invalid without address" do
    post = Post.new(address: nil)
    post.valid?
    expect(post.errors[:address]).to include("can't be blank")      
  end

  # user_idがなければ無効。
  it "is invalid without user_id" do
    post = Post.new(user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end

  # 異なるユーザーはそれぞれ同一のスポット名称を持つ投稿ができる。
  it "does allow each user to have an post which has the same text" do
    user = @user
    user.posts.create(
      text: "スポット名称",
      body: "私のイチオシポイント",
      address: "住所",
      user_id: 1
      )
      another_user = @another_user
      post = another_user.posts.build(
        text: "スポット名称",
        body: "私のイチオシポイント",
        address: "住所",
        user_id: 2
      )
    expect(post).to be_valid
  end
end