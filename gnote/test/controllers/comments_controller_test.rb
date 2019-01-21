require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  setup do
    @comment = comments(:one)

    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:yamada)
    sign_in(@user)
  end

  teardown do
    sign_out(@user)
  end

  test "should get new" do
    sign_in users(:yamada)

    #get :new

    get new_comment_url(1)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { author_hash_ip: @comment.author_hash_ip, body: @comment.body } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
