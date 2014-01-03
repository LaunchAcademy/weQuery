source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'state_machine'
# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'active_model_serializers'

gem 'simple_form', github: 'plataformatec/simple_form'
gem 'omniauth-github'
gem 'omniauth'
gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'

gem 'inherited_resources'
gem 'responders'

gem 'kaminari'

gem 'slugged'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :staging, :production do
  gem 'rails_12factor'
end

group :development do
  gem 'guard-rspec',
    require: false
  gem 'ruby_gntp'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'valid_attribute'
  gem "capybara"
  gem 'factory_girl'
  gem 'launchy'
  gem 'timecop'
  gem 'rake'
  gem 'coveralls', require: false

  gem 'dotenv-rails'

  gem 'quiet_assets'
  gem 'simplecov'

  gem 'spring'
  gem 'spring-commands-rspec'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
