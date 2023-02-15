require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SnowTeach
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.available_locales = :ja
    config.i18n.default_locale = :ja
  end
end
