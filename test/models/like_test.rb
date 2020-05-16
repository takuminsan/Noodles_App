require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @like = Like.create(user_id: @user.id,
                        post_id: posts(:one).id)
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "user id should be present" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "post_id should be present" do
    @like.post_id = nil
    assert_not @like.valid?
  end
end
