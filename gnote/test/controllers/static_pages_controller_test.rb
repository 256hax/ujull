require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get articles_url(:about)
    assert_response :success
  end

end
