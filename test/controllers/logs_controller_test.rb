require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, roles: [ 'admin' ])
  end

  test 'should get logs' do
    sign_in @user
    get logs_url
    assert_response :success
  end
end
