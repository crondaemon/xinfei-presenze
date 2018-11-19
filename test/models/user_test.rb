require 'test_helper'

class PresenceTest < ActiveSupport::TestCase
  test 'should select a user' do
    user = create(:user)
    assert User.find_for_database_authentication([])
  end
end
