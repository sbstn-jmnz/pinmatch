require 'test_helper'

class PrivateMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get private_messages_new_url
    assert_response :success
  end

  test "should get create" do
    get private_messages_create_url
    assert_response :success
  end

end
