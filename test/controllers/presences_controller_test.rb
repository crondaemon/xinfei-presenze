require 'test_helper'

class PresenceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test 'should get home' do
    get root_url
    assert_response :success
    sign_in @user
    get root_url
    assert_response :success
  end

  test 'should not get presence day' do
    get presences_day_url
    assert_response :redirect
  end

  test 'should get presence day' do
    sign_in @user
    get presences_day_url
    assert_response :success
  end

  test 'should mark a presence for today' do
    sign_in @user
    assert_difference('Presence.today') do
      get presences_mark_url, params: { user_id: @user.id }
    end
    assert_response :success
  end

  test 'should mark a presence for another day' do
    sign_in @user
    day = 1.week.ago
    assert_difference('Presence.where(when: day).count') do
      get presences_mark_url, params: { user_id: @user.id, day: day }
    end
    assert_response :success
  end

  test 'should get error for non-existent user' do
    sign_in @user
    id = 1000000
    assert_not User.find_by_id(id)
    assert_no_difference('Presence.count') do
      get presences_mark_url, params: { user_id: id }
    end
    assert_response 422
  end

  test 'should mark and unmark a user' do
    sign_in @user
    assert_no_difference('Presence.today') do
      get presences_mark_url, params: { user_id: @user.id }
      get presences_mark_url, params: { user_id: @user.id }
    end
    assert_response :success
  end

  test 'should get the stats' do
    sign_in @user
    get presences_stats_url
    assert_response :success
  end

  test 'should disable a user' do
    user = create(:user)
    assert_equal true, user.active
    sign_in @user
    get presences_disable_url, params: { id: user.id }
    assert_response :redirect
    assert_equal false, user.reload.active
  end

  test 'should not give error for non-existent user' do
    sign_in @user
    get presences_disable_url, params: { id: -1 }
    assert_response :redirect
  end

  test 'should get the list' do
    Presence.create(user: @user, when: Time.zone.now)
    sign_in @user
    get presences_show_url
    assert_response :success
  end
end
