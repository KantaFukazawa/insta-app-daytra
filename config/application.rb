require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstaAppDaytra
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # アプリケーションの日本語化
    config.i18n.default_locale = :ja
    # アプリケーションのタイムゾーンの日本語化
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  module RailsApp
    class Application < Rails::Application
      # generateで作成するファイルの制限
      config.generators do |g|
        g.assets false
        g.skip_routes true
        g.helper false
        g.test_framework :rspec,
                         view_specs: false,
                         helper_specs: false,
                         routing_specs: false,
                         controller_specs: false,
                         request_specs: true,
                         model_spec: true,
                         fixtures: true
        g.fixture_replacement :factory_bot, dir: 'spec/factories'
      end
    end
  end
end
