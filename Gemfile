source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'simplecov'
  gem 'minitest',  '<= 5.10.3' # can be removed when rails bug will be fixed
  gem 'factory_bot_rails'
  gem 'faker'
end

group :production do
  # Use postgresql as the database for Active Record
  gem 'pg', '~> 0.18'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'chaltron', "< 1.0"
gem "chartkick", ">= 3.2.0"
gem 'rails-bootstrap-datepicker'
# Force activejob version to avoid vulnerable version
gem "activejob", ">= 5.1.6.1"
gem "actionview", ">= 5.1.6.2"
gem "bootstrap-sass", ">= 3.4.1"
gem "nokogiri", ">= 1.10.4"
gem "omniauth", ">= 1.9.0"
gem "devise", ">= 4.7.1"
gem "did_you_mean"
gem "etc"
gem "fileutils"
gem "zlib"
gem "stringio"
gem "date"
gem "strscan"
