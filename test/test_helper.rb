require 'simplecov'
SimpleCov.start('rails') do
  add_filter "/lib/tasks/"
  add_filter "/app/channels/"
  add_filter "/app/jobs"
  add_filter "/app/mailers"
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  #def teardown
  #  Capybara.reset_sessions!
  #  Capybara.use_default_driver
  #end
end
