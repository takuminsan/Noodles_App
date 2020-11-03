require 'rails_helper'

RSpec.describe "post_genre_relation_model", type: :model do
  before do
    @post_genre_relation = FactoryBot.create(:post_genre_relation)
  end

  it "@post_genre_relationが有効であること" do
    expect(@post_genre_relation).to be_valid
  end
end
