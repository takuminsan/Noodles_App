require 'rails_helper'

RSpec.describe "comment_model", type: :model do
  before do
    @comment = FactoryBot.create(:comment)
  end

  it "@commentが有効であること" do
    expect(@comment).to be_valid
  end

  it "user_idが空白のcommentは無効であること" do
    @comment.user_id = nil
    expect(@comment).to be_invalid
  end

  it "post_idが空白のcommentは無効であること" do
    @comment.post_id = nil
    expect(@comment).to be_invalid
  end

  it "contentが空白のcommentは無効であること" do
    @comment.content = " "
    expect(@comment).to be_invalid
  end

  it "contentが200字を超える投稿は無効であること" do
    @comment.content = "a" * 201
    expect(@comment).to be_invalid
  end
end
