require 'rails_helper'
RSpec.describe "post_model", type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user) # Postオブジェクトにはuser_idが必須なので、@userを@postに関連付ける
  end

  it "@postが有効であること" do
    expect(@post).to be_valid
  end

  it "user_idが空白の投稿は無効であること" do
    @post.user_id = nil
    expect(@post).to be_invalid
  end

  it "shop_nameが空白の投稿は無効であること" do
    @post.shop_name = nil
    expect(@post).to be_invalid
  end

  it "nearestが空白の投稿は無効であること" do
    @post.nearest = nil
    expect(@post).to be_invalid
  end

  it "contentが1000字を超える投稿は無効であること" do
    @post.content = "a" * 1001
    expect(@post).to be_invalid
  end
end
