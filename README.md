# Rails Final Project

## Prerequisites and Running Steps

1. Make sure that you have set up the developenvironment and have the following requests installed
    - Ruby [version: 3.2.0]
    - Rails [version: 7.0 (7.0.4 and 7.0.6 all work)]

2. Check the 'Gemfile' for required project dependencies and install them using

    ```bash
    bundle install
    ```

3. Migrate the database and using

    ```bash
    rails db:migrate
    ```

4. Populate the database with initial data from OSU API (https://content.osu.edu/v2/classes/searchLinks), run
    
    ```bash
    rake db:populate
    ```

5. Start the rails server by running

    ```bash
    rails server
    ```
    You can then visit [http://localhost:3000](http://localhost:3000) on your browser to see the result.


------
### Template

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...