require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if Rails.env.development?
  # This isn't threadsafe -- it will work on single-threaded development servers only.
  ALREADY_REMOVED = Set.new

  module ActiveSupport::Dependencies
    class << self
      alias :old_remove_constant :remove_constant

      def remove_constant(const_name)
        if ALREADY_REMOVED.include?(const_name)
          # pass
        else
          ALREADY_REMOVED.add(const_name)
          old_remove_constant(const_name)
        end
      end
    end
  end

  class UnloadCyclesMiddleware
    def initialize(app, opts = {})
      @app = app
    end

    def call(env)
      ALREADY_REMOVED.clear
      @app.call(env)
    end
  end
end

module Shopity
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.middleware.insert_before(ActionDispatch::Reloader, UnloadCyclesMiddleware)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
