source 'https://rubygems.org'

gem 'rails', '4.0.5'
gem 'devise'
gem 'coveralls', require: false
gem 'capistrano', '~> 3.2.0'
gem 'pg'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-debugger'
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
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'growl'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :test do
  gem 'factory_girl_rails'
  gem 'nokogiri'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'database_cleaner'
end

gem 'jquery-rails'
