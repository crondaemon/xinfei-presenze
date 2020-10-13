require 'test_helper'

class CleaningControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test 'should not get today' do
    get cleaning_path
    assert_response :redirect
  end

  test 'should get today' do
    sign_in @user
    get cleaning_path
    assert_response :success
  end

  test 'should set the shifts' do
    cleaner = create(:user, cleaner: true)
    rest = create(:user, cleaner: true)

    Presence.create(user: cleaner, when: Time.current)
    Presence.create(user: rest, when: Time.current)

    sign_in @user

    assert_difference("User.find(#{cleaner.id}).cleaning_shifts") do
      assert_difference("User.find(#{rest.id}).rest_shifts") do
        post cleaning_confirm_path, params: { ids: [cleaner.id] }
        assert_response :success
      end
    end
  end
end
