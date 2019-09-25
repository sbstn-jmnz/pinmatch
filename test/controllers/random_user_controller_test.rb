require 'test_helper'

class RandomUserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'unlogged user will be redirected to sign_in' do
    get random_user_new_url
    assert_response :redirect
  end

  test 'an authenticated user should get success' do
    sign_in users(:one)
    get random_user_new_url
    assert_response :success
  end
end
