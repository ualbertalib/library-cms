# library-cms

This is the CMS for the University of Alberta Libraries website. It uses Comfy Mexican Sofa.

## Applications

+ MariaDB database for CMS

## Development environment

+ Ruby < 3.5
+ Rails 8.1.x
+ MariaDB 5.5
+ Docker and docker-compose
+ yarn
+ nodejs v18+

## Requirements

Update: As of August 2026, ActiveStorage is not being used (images are located outside the CMS).

File attachments are handled by ActiveStorage. You will need to copy over database migrations by running rails active_storage:install
To resize attached images you'll need to have ImageMagic installed.
Pagination is handled by either Kaminari or WillPaginate. Make sure you have one defined in your Gemfile.

## Setting up the Application

1. `git clone git@github.com:ualbertalib/library-cms.git`
2. `cd library-cms`
3. `bin/setup`
4. `bin/dev`
5. visit [http://localhost:3000](http://localhost:3000) and you will see the library homepage.
6. If you need to visit the admin section ([http://localhost:3000/admin](http://localhost:3000/admin)) - You'll be prompted to enter username and password (use the ones in your `config/settings/development.yml` (managed by the [Config Gem](https://www.rubydoc.info/gems/config/5.1.0)), which by default are 'admin' and 'mysecretpassword')

## Testing

To run the tests for the library-cms application, you can use the following command once your application has been setup from above:

``` bash
bundle exec rails test
```

This will execute all the test cases and provide you with the test results.

NOTE: We preload the test database with all the seed CMS data (pages/layouts/etc) before tests are run. This happens only once.
Therefore, if you make a change to the CMS seed data, you must drop the test DB for your changes to be reflected in the test database.

### Manual testing

As part of the August 2026 partial migration of content from this CMS tool to the centrally managed CMS, most of the routes available in the CMS (and seed data) are redirected by production server to the central CMS. See [CR1345](https://monitor.library.ualberta.ca/unixDoc/Change/2026/Q3/CR1345.html) for details.

Manual testing should focus on the routes that are not being redirected (i.e., retained in the Library CMS) which include:

+ /admin (admin route)
+ /archives
+ /peel
+ /staffhub
+ /cms-css/1/archives.css
+ /cms-css/1/english-main.css
+ /cms-css/1/peel-prairie-provinces.css
+ /cms-css/1/left-navigation-html.css
+ /assets/ (Rails generated assets used mainly by the admin route)

The above is not an exhaustive list.

These routes should be manually tested when building releases of Library CMS.

The CMS seed data stored in this repository is not regularly updated from production.

## Features

![image](https://github.com/user-attachments/assets/28428b92-5e93-4cfc-860a-c51692087bdd)

![image](https://github.com/user-attachments/assets/47d199ff-0712-43ac-b997-0d8633c4eb83)
