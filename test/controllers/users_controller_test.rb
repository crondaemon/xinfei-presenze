require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, roles: [ 'user_admin' ])
  end

  test 'should get index' do
    sign_in @user
    get users_url
    assert_response :success
  end

  test 'should create a new user' do
    sign_in @user
    user = build(:user)
    assert_difference('User.count') do
      post users_url, params: { user: { fullname: user.fullname, email: user.email, password: user.password, active: user.active } }
    end
    assert User.find_by_email(user.email).active
  end

  test 'should change user\'s active status' do
    sign_in @user
    user = create(:user)
    patch user_url(user), params: { user: { active: false } }
    assert_not user.reload.active
  end

  test 'should update self' do
    sign_in @user
    patch self_update_users_url, params: { user: { active: false } }
    assert_not @user.reload.active
  end

  test 'should destroy a user' do
    sign_in @user
    user = create(:user)
    assert_difference('User.count', -1) do
      delete user_url(user)
    end
    assert_response :redirect
  end

  test 'should not self-destroy' do
    sign_in @user
    assert_no_difference('User.count') do
      delete user_url(@user)
    end
    assert_response :redirect
  end
end
