# frozen_string_literal: true

require_relative 'boot'

%w[
  rails
  action_controller/railtie
  action_view/railtie
  rails/test_unit/railtie
  sprockets/railtie
].each do |railtie|
  require railtie
rescue LoadError
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebSmbBrowser
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en]

    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.jbuilder = false
    config.generators.helper = false
    config.generators.test_framework(:test_unit, fixture: false)
    config.generators.template_engine :slim

    def sambal(options = {})
      @sambal ||= Sambal::Client.new(
        {
          domain: 'WORKGROUP',
          host: '192.168.1.2',
          share: 'public',
          user: 'guest',
          password: '--no-pass',
          port: 445
        }.merge(options)
      )
    end

    def theme_names
      @theme_names ||= %w[
        amelia
        bootstrap3
        cerulean
        cosmo
        cyborg
        darkly
        flatly
        journal
        lumen
        paper
        readable
        sandstone
        simplex
        slate
        spacelab
        united
        yeti
      ]
    end
  end
end
