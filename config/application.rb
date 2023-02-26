require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SnowTeach
  class Application < Rails::Application
    config.load_defaults 6.1
    config.generators.system_tests = nil

    config.i18n.available_locales = :ja
    config.i18n.default_locale = :ja
    config.i18n.fallbacks = [I18n.default_locale]
    config.generators do |g|
      g.test_framework :rspec,
                       model_specs: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
    end
  end
end
