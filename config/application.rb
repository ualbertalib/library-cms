require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HomeCms
  class Application < Rails::Application
    # Ensuring that ActiveStorage routes are loaded before Comfy's globbing
    # route. Without this file serving routes are inaccessible.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]
    # Initialize configuration defaults for originally generated Rails version.
    # TODO: needs to be deployed with the following two lines, then can update `config.load_defaults 7.0` and remove the 
    # `cache_format_version`
    config.load_defaults 6.1
    config.active_support.cache_format_version = 7.0

    config.exceptions_app = self.routes
    config.active_record.legacy_connection_handling = false

    # Active Storage default variant processor changed to :vips 
    # TODO: evalutate if we're ready for the change to vips
    Rails.application.config.active_storage.variant_processor = :mini_magick

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
