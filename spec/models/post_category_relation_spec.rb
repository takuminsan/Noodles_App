require 'rails_helper'

RSpec.describe "post_category_relation_model", type: :model do
  before do
    @post = FactoryBot.create(:post, user: @user)
    @category = FactoryBot.create(:category)
    @post_category_relation = Post_category_relation.create(post_id: @post.id,
                                                            category_id: @category.id)
  end

  it "@post_category_relationが有効であること" do
    expect(@post_category_relation).to be_valid
  end

  it "post_idが空白のpost_category_relationは無効であること" do
    @post_category_relation.post_id = nil
    expect(@post_category_relation).to be_invalid
  end

  it "category_idが空白のpost_category_relationは無効であること" do
    @post_category_relation.category_id = nil
    expect(@post_category_relation).to be_invalid
  end
end
