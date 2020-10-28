require 'rails_helper'

RSpec.describe "post_genre_relation_model", type: :model do
  before do
    @post_genre_relation = FactoryBot.create(:post_genre_relation)
  end

  it "@post_genre_relationが有効であること" do
    expect(@post_genre_relation).to be_valid
  end

  it "post_idが空白のpost_genre_relationは無効であること" do
    @post_genre_relation.post_id = nil
    expect(@post_genre_relation).to be_invalid
  end

  it "genre_idが空白のpost_genre_relationは無効であること" do
    @post_genre_relation.genre_id = nil
    expect(@post_genre_relation).to be_invalid
  end
end
