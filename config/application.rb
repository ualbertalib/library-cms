require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HomeCms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    # Ensuring that ActiveStorage routes are loaded before Comfy's globbing
    # route. Without this file serving routes are inaccessible.
    config.railties_order = [ ActiveStorage::Engine, :main_app, :all ]
    config.exceptions_app = self.routes

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # this is for the cms edit page preview and update buttons.
    # app/views/comfy/admin/cms/pages/_form.html.haml
    # https://github.com/ualbertalib/library-cms/issues/378
    # Behaviour changes when using Ruby 3.0 so can likely remove after that point.
    # TODO: Appears to still be an issue in Ruby 3.0, need to investigate this further.
    config.action_view.automatically_disable_submit_tag = false

    # We currently use mini_magick for ActiveStorage. VIPS is now the default. So we need to explicitly specify this.
    # Delete this line if we ever migrate to VIPS
    config.active_storage.variant_processor = :mini_magick
  end
end
