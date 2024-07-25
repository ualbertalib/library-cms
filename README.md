# library-cms

This is the CMS for the University of Alberta Libraries website. It uses Comfy Mexican Sofa.

## Applications

+ MariaDB database for CMS

## Development environment

+ Ruby 3.1.4
+ Rails 7.0.x
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
5. `bundle exec rails db:setup`
6. `bundle exec rails server`
7. visit [http://localhost:3000](http://localhost:3000) and you will see the library homepage.
8. If you need to visit the admin section ([http://localhost:3000/admin](http://localhost:3000/admin)) - You'll be prompted to enter username and password (use the ones in your `config/secrets.yml`, which by default are 'admin' and 'mysecretpassword')


## Testing
To run the tests for the library-cms application, you can use the following command once your application has been setup from above:

```
bundle exec rails test
```

This will execute all the test cases and provide you with the test results.

NOTE: We preload the test database with all the seed CMS data (pages/layouts/etc) before tests are ran. This happens only once. 
So if you make a change to the CMS seed data, you must drop the test DB for your changes to be reflected in the test database.

## Features

![image](https://user-images.githubusercontent.com/1220762/173146961-b8430fca-4d41-4c8c-a413-8bd0ac6cc929.png)

![image](https://user-images.githubusercontent.com/1220762/173147029-3d5f952c-5bae-415e-a9ee-29dc8fc656a8.png)

![image](https://user-images.githubusercontent.com/1220762/173147203-eb68a6f7-73c4-4a5d-ab57-95169d3d0f16.png)

![image](https://user-images.githubusercontent.com/1220762/173147294-715b940e-66dd-4c40-b874-cf4051ba0169.png)
