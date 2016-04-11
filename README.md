# Brief

Create a simple Ruby on Rails (4) application that pulls contact data from a Google Drive spreadsheet and store those contacts as separate documents in a MongoDB instance.

Bonus question: Expose those documents through an API endpoint in JSON format.

## Proposal

__Assumption:__ The spreadsheet is listed in forename, surname, email address, phone number; all fields are filled out.

1. User authenticates with Google;
2. A list of available spreadsheets (their latest viewed) are shown;
3. The user chooses the applicable spreadsheet (check `address_book_example.csv`);
4. The app imports from row 2 (ignoring assumed context headers); each row is stored as a separate document in a MongoDB instance;
    * MVP+: User can pick which columns are forename, surname &c.;
    * MVP+: User can manually run-through contacts with missing information;
5. The user is directed to another page showing the list of imported contacts;
    * MVP+: User can edit/delete each contact individually.

### Versions

ruby 2.1.2p95
Rails 4.2.6

### Test suite

    rspec 

### Gems

    gem 'rails', '4.2.6'
    # run bundle update rails
    
    gem 'thin'
    
    gem 'mongoid'
    
    gem 'figaro'
    gem 'omniauth-google-oauth2'
    gem 'google_drive'
    
    ...
    
    group :development, :test do 
        gem 'rspec-rails'
        gem 'factory_girl_rails'
        ...
    end
    
    group :test do
        gem 'database_cleaner'
        gem 'faker'
        gem 'guard-rspec'
        gem 'capybara'
        gem 'launchy'
    end

* MongoDB
    * `rails g mongoid:config`  
    * Start `mongod`
* RSpec
    * `rails g rspec:install`
* Figaro
    * `bundle exec figaro install`
* Omniauth
    * `touch config/initializers/omniauth.rb`

### Model: `Contact`

* `forename` String
* `surname` String
* `email` String
* `phone` String

### Controller: `contacts`

* `#index` Welcome page, linking to Google authentication
* `#authenticate` Authenticates Google Drive, retrieves list of latest spreadsheets
* `#import` Takes `:key` as spreadsheet key and imports the contact data into documents
* `#book` Shows list of imported contacts

### Credentials

1. [Google Developers Console](https://console.developers.google.com/) > Enable Drive API and Google+ API
2. Credentials > Create Credentials > OAuth Client ID > Web Application
    * Authorized JavaScript origins: `http://localhost:3000`
    * Authorized redirect URIs: `http://localhost:3000/auth/google/callback`
        * Set up routes.rb: `get "/auth/:provider/callback", to: "contacts#authenticate"`
3. Save client ID and client secret to `config/application.yml` (`GOOGLE_CLIENT_ID` and `GOOGLE_SECRET_ID`)

#### _config/initializers/omniauth.rb_

    Rails.application.config.middleware.use OmniAuth::Builder do 
      provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], scope: "email, profile, drive", name: "google"
    end


## Task list

__Monday__: 

* Set up project;
* Set up MongoDB;
* Set up RSpec;
* Set up `Contact` model and `contacts` controller;
* Set up `Contact` model test;
* Set up `Contact` model validations;
* Set up OmniAuth and Google authentication;
* Set up `contacts` controller methods for skeleton authenticate > list > import;
* Set up basic styles and templating.

__Tuesday__:

* JSON API endpoint (use `rabl`);
* Check tests;
* Delete import data after one hour, end of session, whenever;
* Refactor code;
* Make it fool-proof;
* Better templating/rendering;
* Heroku?!
