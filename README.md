# Park Lookup API
### _Epicodus Practice in Ruby on Rails, December 15, 2017_

By: Megan Olson

## Description

Rails API that allows a user to search for parks within states. Functionality includes all CRUD usage and Basic Authentication.

## Setup/Installation

* Set up the Park Lookup API to run on a separate localhost port:
  * First, clone the repository from [https://github.com/MegOlson/park_lookup](https://github.com/MegOlson/park_lookup) and run the following commands in the API root directory:
    ```
    bundle update
    rake db:setup
    rails db:seed
    rails s -p 3001
    ```
## Gaining Access

To gain access to anything more than a simple GET request, username and password are required within the params of your first API call. Doing so will produce a headers Authentication section that is required in every API call. The simplest way is using Postman:

* Download Postman on your computer.
* Follow the Setup/Installation steps above and insert the first GET request listed in the endpoints section below.
* Click on the 'Authorization' section before processing the request and insert the username and password.
* Process your request and reference your 'headers' section for your newly produced API Key.

#### Adding API Key to Project

* Add `gem 'dotenv-rails'` to your Gemfile and Bundle Install.
* Create an '.env' file in your root directory.
* Set your key to a vairable name to refernce in the rest of your application.
* Add your '.env' file to your Gitignore file for security/protection.

# Endpoints/API calls

To see endpoint results sign in or create an account with Postman.
In the URI line put the following URIs:

* To get one page of states:
  `GET 'http://localhost:3000/api/v1/states'`
  * to get other pages add `?page={page number}` to the end of the URI
* To get a singular state:
  `GET 'http://localhost:3000/api/v1/states/{state_id}'`
* To get state by specific name: (case sensitive)
  `GET 'http://localhost:3000/api/v1/states/'`
  Params key: name -- value: string
* To get a state's parks:
  `GET 'http://localhost:3000/api/v1/states/{state_id}/parks'`
* To get a state's park by a specific name: (case sensitive & must input full name, not part of name)
  `GET 'http://localhost:3000/api/v1/states/{state_id}/parks'`
  Params key: name -- value: string
* To get a random park from a specific state:
  `GET 'http://localhost:3000/api/v1/states/{state_id}/parks'`
  Params key: random -- value: true
* To add a state:
  `POST 'http://localhost:3000/api/v1/states/`
  Params key: name -- value: string
* To add a state's park:
  `POST 'http://localhost:3000/api/v1/states/{state_id}/parks`
  Params key: name -- value: string
* To update a state:
  `PUT 'http://localhost:3000/api/v1/states/{state_id}`
  (add the key param of what you wish to change)
  Params key: name -- value: string
* To update a state's park:
  `PUT 'http://localhost:3000/api/v1/states/{state_id}/parks`
  (add the key param of what you wish to change)
  Params key: name -- value: string
* To delete a state:
  `DELETE 'http://localhost:3000/api/v1/states/{state_id}`
* To delete a state's park:
  `DELETE 'http://localhost:3000/api/v1/states/{state_id}/parks/{park_id}`

## Known Bugs

No known bugs.

##Technologies Used

* Ruby/Rails
* ActiveRecord

### License

Copyright (c) 2017 **Megan Olson**

*This software is licensed under the MIT license.*
