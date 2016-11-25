Devise.setup do |config|
  require "devise/orm/active_record"

  config.secret_key =
    "e28176cc1556469e24eabdaba029d7af2c2490e39d4e157f129bf27a9bc3937e" \
    "ff1dd64df6206e6362e41e7ec18655d839c7cc2493df19746042bf274fe88eaa"
  config.mailer_sender = "lee@perfectcircletheatre.com"
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
