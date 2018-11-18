require 'test_helper'

class PresenceTest < ActiveSupport::TestCase
  test 'should create a presence' do
    presence = build(:presence)
    assert presence.save
  end
end
