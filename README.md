# library-cms

This is the CMS for the University of Alberta Libraries website. It uses Comfy Mexican Sofa. This repository also contains the staff profiles application.

## Applications 

+ MariaDB database for profiles application and CMS

## Development environment

+ Ruby 3.1.3
+ Rails 7.0.2
+ MariaDB 5.5
+ Docker and docker-compose
+ yarn and nodejs 16+

## Requirements

File attachments are handled by ActiveStorage. You will need to copy over database migrations by running rails active_storage:install
To resize attached images you'll need to have ImageMagic installed.
Pagination is handled by either Kaminari or WillPaginate. Make sure you have one defined in your Gemfile.

## Setting up the Application

1. `git clone git@github.com:ualbertalib/library-cms.git`
2. `cd library-cms`
3. `bundle install && yarn install`
4. `docker-compose up -d`
5. `rake db:create && rake db:migrate`
6. change default credentials for your development environment by editing `config/initializers/comfortable_mexican_sofa.rb`:
```
    ComfortableMexicanSofa::AccessControl::AdminAuthentication.username = 'dev-username'
    ComfortableMexicanSofa::AccessControl::AdminAuthentication.password = 'dev-password'
```
    also add default credentials in 'app/controllers/profiles_controller.rb' :
    http_basic_authenticate_with name: Rails.application.secrets.cms_user, password: Rails.application.secrets.cms_password, except: [:index, :show]
    replace Rails.application.secrets.cms_user with "dev-username" and Rails.application.secrets.cms_password with "dev-password"
    
7. `rails s`
8. visit http://localhost:3000/admin - You'll be prompted to enter username and password (use the ones you created in step 6)
9. In the admin area create a site called "ualberta-libraries"
10. Seed database: `rake 'comfy:cms_seeds:import[library-cms-seeds, ualberta-libraries]'` may take a couple of minutes
11. visit http://localhost:3000 and you will see the library homepage. 

## Features

![image](https://user-images.githubusercontent.com/1220762/173146961-b8430fca-4d41-4c8c-a413-8bd0ac6cc929.png)

![image](https://user-images.githubusercontent.com/1220762/173147029-3d5f952c-5bae-415e-a9ee-29dc8fc656a8.png)

![image](https://user-images.githubusercontent.com/1220762/173147203-eb68a6f7-73c4-4a5d-ab57-95169d3d0f16.png)

![image](https://user-images.githubusercontent.com/1220762/173147294-715b940e-66dd-4c40-b874-cf4051ba0169.png)







