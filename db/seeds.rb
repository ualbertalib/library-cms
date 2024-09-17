# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comfy::Cms::Site.create!(identifier: "ualberta-libraries", hostname: "localhost")
Rake::Task["comfy:cms_seeds:import"].invoke("library-cms-seeds", "ualberta-libraries")

Admin.create(
  email: "admin@ualberta.ca",
  password: "password"
)
