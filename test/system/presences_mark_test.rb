require 'test_helper'

class PresencesMarkTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, roles: ['admin', 'user_admin'])
    Capybara.current_driver = :selenium
  end

  test 'file' do
    10.times do
      create(:user)
    end
    sign_in @user
    visit(presences_day_path)
    assert_equal presences_day_url(only_path: true), current_path
    find('td', text: User.last.fullname, match: :first).click
  end
end
