Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

RSpec.configure do |config|
  config.include Warden::Test::Helpers
end
