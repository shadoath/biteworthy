Rails.application.configure do
  config.app_version = ".0.2"

  # Settings specified here will take precedence over those in config/application.rb.
   #Rails.configuration.s3[:s3_bucket]
   config.s3 = {
      s3_bucket:               "biteworthydurangodev",
      AWS_ACCESS_KEY_ID:       "AKIAJ7XZ6BKJXGFDGDMA",
      AWS_SECRET_ACCESS_KEY:   "+82hOkPePIKqSX4B23j8WJabOsd8YV/P0wsPnQfT"
   }
   Paperclip.options[:command_path] = "/usr/bin/convert/"
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
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds extraal error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  # Devise mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


end
