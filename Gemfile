source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "5.0.0.1"

gem "pg"
gem "rack-cache"

# Use SCSS for stylesheets
gem "sass-rails"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails"

# Use jquery as the JavaScript library
gem "jquery-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 1.2"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem "sdoc", require: false
end

# Use Devise for user authentication
gem "devise"

# Use RedCloth for text formatting
gem "RedCloth"

# Add gem for heroku hosting support
gem "rails_12factor", group: :production

# Add New Relic gem for performance tracking
gem "newrelic_rpm"

# Add Paperclip and Amazon Web Services for image management
gem "paperclip"
gem "aws-sdk"

# Add Postmark for email sending
gem "postmark-rails"

# Add Rubocop for code styling
gem "rubocop", group: :production

group :development do
  gem "web-console", "~> 2.0"
end

group :development, :test do
  gem "rspec-rails", "~> 3.5"
  gem "factory_girl_rails"
  gem "spring"
end

group :test do
  gem "database_cleaner"
  gem "capybara-webkit"
  gem "coveralls", require: false
end

# Specify ruby version for heroku
ruby "2.3.1"
