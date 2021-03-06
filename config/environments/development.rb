Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: ENV["GMAIL_DOMAIN"],
    authentication: "plain",
    enable_starttls_auto: true,
<<<<<<< HEAD
    user_name: "fmaymone@gmail.com",
    password: "crazydiamond"
  }
# config.action_mailer.smtp_settings = {
#   :address   => "smtp.mandrillapp.com",
#   :port      => 587,
#   :user_name => ENV["MANDRILL_USERNAME"],
#   :password  => ENV["MANDRILL_API_KEY"],
#   :authentication => 'login',
#   :enable_starttls_auto => true,
#   :domain  => 'sociedadeavalia.com.br'
# }
=======
    user_name: ENV["GMAIL_USERNAME"],
    password: ENV["GMAIL_PASSWORD"]
  }


# config.action_mailer.smtp_settings = {
#     address: 'smtp.mandrillapp.com',
#     port: 587,
#     enable_starttls_auto: true,
#     user_name: 'fmaymone@gmail.com',
#     password: 'crazydiamond',
#     authentication: 'login'
#   }
  # config.action_mailer.smtp_settings = {
  #   address:'smtp.mandrillapp.com',
  #   authentication: 'plain',
  #   domain: 'localhost',
  #   enable_starttls_auto: true,
  #   password: ENV.fetch("MANDRILL_APIKEY"),
  #   port: "587",
  #   user_name: ENV.fetch("MANDRILL_USERNAME")
  # }


>>>>>>> 85558923204275fbb07ecb9f998d2a46454b9b54


  config.paperclip_defaults = {
  storage: :s3,
  # s3_region: 'us-east-1',
    s3_credentials: {
      bucket: ENV["S3_BUCKET"],
      access_key_id: ENV["S3_KEY_ID"],
      secret_access_key: ENV["S3_ACESS_KEY"],
      s3_region: ENV["AWS_REGION"],
    }
  }
  config.time_zone = 'Brasilia'
  config.active_record.default_timezone = :local
end
