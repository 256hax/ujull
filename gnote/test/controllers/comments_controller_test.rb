require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    host! 'localhost:3000'

    #@request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:one)
    sign_in(@user)
    #sign_in users(:one), scope: :user

    @comment = comments(:one)
  end

  teardown do
    sign_out(@user)
  end

  test "should get new" do
    #get :new

    get new_comment_url(1)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comment_url(1), params: { comment: { author_hash_ip: @comment.author_hash_ip, body: @comment.body } }
    end

    assert_redirected_to root_url
  end

  # test "should destroy comment" do
  #   assert_difference('Comment.count', -1) do
  #     delete comment_url(@comment)
  #   end
  #
  #   assert_redirected_to comments_url
  # end
end
