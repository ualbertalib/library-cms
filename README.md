# library-cms

This is the CMS for the University of Alberta Libraries website. It uses Comfy Mexican Sofa. This repository also contains the staff profiles application.

## Applications 

+ MariaDB database for profiles application and CMS

## Development environment

+ Ruby 2.7.5
+ Rails 7.0.2
+ MariaDB 5.5

## Requirements

Rails 5.2 or 6.0
File attachments are handled by ActiveStorage. You will need to copy over database migrations by running rails active_storage:install
To resize attached images you'll need to have ImageMagic installed.
Pagination is handled by either Kaminari or WillPaginate. Make sure you have one defined in your Gemfile.

## Setting up the Application

1. Clone library-cms
2. bundle install
3. rake db:migrate
4. change default credentials for your development environment by editing /config/initializers/comfortable_mexican_sofa.rb:

    ComfortableMexicanSofa::AccessControl::AdminAuthentication.username = 'dev-username'
    ComfortableMexicanSofa::AccessControl::AdminAuthentication.password = 'dev-password'

5. visit http://localhost:3000/admin - You'll be prompted to enter username and password (use the ones you created in step 4)
6. In the admin area create a site called "ualberta-libraries"
7. Seed database: rake 'comfy:cms_seeds:import[library-cms-seeds, ualberta-libraries]'
8. visit http://localhost:3000 and you will see the library homepage. 






