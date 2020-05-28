require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get index" do
    log_in_as(@user)
    get maps_path
    assert_response :success
  end

end
