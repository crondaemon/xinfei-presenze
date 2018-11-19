require 'simplecov'
SimpleCov.start('rails') do
  add_filter "/lib/tasks/"
  add_filter "/app/channels/"
  add_filter "/app/jobs"
  add_filter "/app/mailers"
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
