source 'https://rubygems.org'
ruby "2.4.2"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.5'

group :production do
  gem 'mysql2'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'webpacker'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'guard-rspec'
gem 'pdf-reader'
gem 'mail_form'
gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'midilib'
gem 'redcarpet'
gem 'devise'
gem 'cancancan'
gem 'formtastic'
gem 'formtastic-bootstrap'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'puma'
group :development, :test do
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-rbenv'
  gem 'capistrano-nvm', require: false;
  gem 'capistrano-yarn'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'phantomjs'
  gem 'poltergeist'
end
group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

