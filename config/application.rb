require File.expand_path('../boot', __FILE__)

#require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

require "action_controller/railtie"
require "action_mailer/railtie"
# require "active_resource/railtie"
require "sprockets/railtie"
Bundler.require(*Rails.groups(:assets => %w(development test)))

module FeedFoundrie
  class Application < Rails::Application
    # config.generators do |g|
    #   g.orm :mongoid
    # end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/lib)
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.action_mailer.delivery_method = :smtp

    # ActionMailer::Base.smtp_settings = {
    #                                       :port           => 587,
    #                                       :address        => "smtp.mailgun.org",
    #                                       :domain         => ENV['mail_domain'],
    #                                       :user_name      => ENV['mail_username'],
    #                                       :password       => ENV['mail_password'],
    #                                       :authentication => :plain,
    #                                     }


    ActionMailer::Base.smtp_settings = {
                                          :port           => 587,
                                          :address        => "smtp.mailgun.org",
                                          :domain         => "sandboxf62e06114cf849cc85e439f14d1af784.mailgun.org",
                                          :user_name      => "postmaster@sandboxf62e06114cf849cc85e439f14d1af784.mailgun.org",
                                          :password       => "5dec8db112cf43cdc2e7fd587774c640",
                                          :authentication => :plain,
                                        }
  end
end
