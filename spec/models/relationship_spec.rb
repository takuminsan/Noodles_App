require 'rails_helper'

RSpec.describe "relationship_model", type: :model do
  before do
    @follower = FactoryBot.create(:user, name: "フォローする人", email: "follower@example.com")
    @followed = FactoryBot.create(:user, name: "フォローされる人", email: "followed@example.com")
    @relationship = Relationship.create(follower_id: @follower.id,
                                        followed_id: @followed.id)
  end

  it "@relationshipが有効であること" do
    expect(@relationship).to be_valid
  end

  it "follower_idが空白のrelationshipは無効であること" do
    @relationship.follower_id = nil
    expect(@relationship).to be_invalid
  end

  it "followed_idが空白のrelationshipは無効であること" do
    @relationship.followed_id = nil
    expect(@relationship).to be_invalid
  end
end
