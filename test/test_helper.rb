ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Seed the database with our CMS seed data, if it's not already there
if Rake::Task.tasks.empty? && Comfy::Cms::Site.count.zero?
  HomeCms::Application.load_tasks

  Comfy::Cms::Site.create!(identifier: 'ualberta-libraries', hostname: 'localhost')
  Rake::Task['comfy:cms_seeds:import'].invoke('library-cms-seeds', 'ualberta-libraries')
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
