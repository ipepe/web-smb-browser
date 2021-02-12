require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = :pl
    config.i18n.available_locales = [:pl, :en]

    config.active_job.queue_adapter = :sidekiq
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.jbuilder = false
    config.generators.helper = false
    config.generators.test_framework(:test_unit, fixture: false)
    config.generators.template_engine :slim

    def theme_names
      @theme_names ||= %w(
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
      )
    end
  end
end
