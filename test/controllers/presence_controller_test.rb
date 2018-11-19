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
    get presence_day_url
    assert_response :redirect
  end

  test 'should get presence day' do
    sign_in @user
    get presence_day_url
    assert_response :success
  end

  test 'should mark a presence for today' do
    sign_in @user
    assert_difference('Presence.today') do
      get presence_mark_url, params: { user_id: @user.id }
    end
    assert_response :success
  end

  test 'should mark a presence for another day' do
    sign_in @user
    day = 1.week.ago
    assert_difference('Presence.where(when: day).count') do
      get presence_mark_url, params: { user_id: @user.id, day: day }
    end
    assert_response :success
  end

  test 'should get error for non-existent user' do
    sign_in @user
    id = 1000000
    assert_not User.find_by_id(id)
    assert_no_difference('Presence.count') do
      get presence_mark_url, params: { user_id: id }
    end
    assert_response 422
  end

  test 'should mark and unmark a user' do
    sign_in @user
    assert_no_difference('Presence.today') do
      get presence_mark_url, params: { user_id: @user.id }
      get presence_mark_url, params: { user_id: @user.id }
    end
    assert_response :success
  end

  test 'should get the stats' do
    sign_in @user
    get presence_stats_url
    assert_response :success
  end

  test 'should disable a user' do
    user = create(:user)
    assert_equal true, user.active
    sign_in @user
    get presence_disable_url, params: { id: user.id }
    assert_response :redirect
    assert_equal false, user.reload.active
  end

  test 'should get the list' do
    Presence.create(user: @user, when: Time.zone.now)
    sign_in @user
    get presence_show_url
    assert_response :success
  end

  test 'should import names' do
    sign_in @user
    names = [ 'user1', 'the user 2', 'user 3']
    assert_difference('User.count', 3) do
      post presence_bulk_save_url, params: { names: names.join("\n") }
    end
    assert_response :redirect
    names.each do |name|
      expected = name.split.map(&:capitalize).join(' ')
      assert User.find_by_fullname(expected)
    end
  end

  test 'should redirect if not names' do
    sign_in @user
    assert_no_difference('User.count') do
      post presence_bulk_save_url, params: { names: "" }
    end
    assert_response :redirect
  end
end
