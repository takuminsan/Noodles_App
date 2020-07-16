require 'rails_helper'

RSpec.describe "like_model", type: :model do
  before do
    @like = FactoryBot.create(:like)
  end

  it "@likeが有効であること" do
    expect(@like).to be_valid
  end

  it "user_idが空白のlikeは無効であること" do
    @like.user_id = nil
    expect(@like).to be_invalid
  end

  it "post_idが空白のlikeは無効であること" do
    @like.post_id = nil
    expect(@like).to be_invalid
  end
end
