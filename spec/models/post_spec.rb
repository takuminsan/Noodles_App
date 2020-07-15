require 'rails_helper'
RSpec.describe "post_model" do
  before do
    @user = build(:michael)
    @post = @user.posts.build(shop_name: "Noodles",
                              nearest: "新宿駅",
                              content: "ラーメン美味しい")
  end

  it "@postが有効であること" do
    expect(@post).to be_valid
  end

  it "投稿にuser_idが必ず存在していること" do
    @post.user_id = nil
    expect(@post).to be_invalid
  end

  it "投稿にshop_nameが必ず存在していること" do
    @post.shop_name = nil
    expect(@post).to be_invalid
  end

  it "投稿にnearestが必ず存在していること" do
    @post.nearest = nil
    expect(@post).to be_invalid
  end

  it "投稿のcontentは1000字以下であること" do
    @post.content = "a" * 1001
    expect(@post).to be_invalid
  end
end
