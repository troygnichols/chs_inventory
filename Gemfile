source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.1.2'

gem 'rails', '4.0.10'
gem 'devise'
gem 'coveralls', require: false
gem 'pg'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'faker'
  gem 'annotate'
  gem 'thin'
end

group :production do
    gem 'rails_12factor', '0.0.2'
    gem 'unicorn'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'uglifier'
end

group :development do
  gem 'growl'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'
end

group :test do
  gem 'factory_girl_rails'
  gem 'nokogiri'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'database_cleaner'
end

gem 'jquery-rails'
