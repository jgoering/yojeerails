require 'test_helper'

class YojeeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yojee_index_url
    assert_response :success
  end

end
