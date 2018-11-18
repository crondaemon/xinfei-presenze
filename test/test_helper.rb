require 'simplecov'
SimpleCov.start('rails') do
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
