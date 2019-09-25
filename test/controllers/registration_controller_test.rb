require 'test_helper'

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get random user" do
    post "/users", params: { user: { name: "Elviro", password: "123456", password_confirmation: "123456", email: 'user@fake.cl'} }
    assert_redirected_to random_user_path
  end
end
