require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  setup do
    @message = messages(:one)

    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:yamada)
    sign_in(@user)
  end

  teardown do
    sign_out(@user)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    # @request.env['devise.mapping'] = Devise.mappings[:user]
    # sign_in users(:yamada)

    #get :new
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { author_hash_ip: @message.author_hash_ip, body: @message.body } }
    end

    assert_redirected_to message_url(Message.last)
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end

    assert_redirected_to messages_url
  end
end
