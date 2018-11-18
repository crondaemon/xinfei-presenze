require 'test_helper'

class PresenceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test 'should not get home' do
    get presence_day_url
    assert_response :redirect
  end

  test 'should not home' do
    sign_in @user
    get presence_day_url
    assert_response :success
  end
end
