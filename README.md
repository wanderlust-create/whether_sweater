<img src="https://user-images.githubusercontent.com/67713820/172872889-7ec2bc87-2bd9-4c1b-b9a9-d2b18bda244e.png" alt="logo" max-width="600"><br>

# Weather Sweater

![rails-badge](https://img.shields.io/badge/Rails-5.2.8-blue) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.4-orange)
[![GitHub version](https://badge.fury.io/gh/wanderlust-create%2Fwhether_sweater.svg)](https://badge.fury.io/gh/wanderlust-create%whether_sweater)
[![PRsWelcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

### This application serves as a platform that exposes API endpoints to check the weather, search for restaurants, search for images, and help plan road trips. 


### My Online Store application details 
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#gems">Important Gems</a></li>
        <li><a href="#set-up">Set Up</a></li>
      </ul> 
    </li>
        </ul>
    <li>
      <a href="#how-to-use-this-app">How to use this application</a>
       <ul>
        <li><a href="#create-your-merchant-account">Create your merchant account</a></li>
         <ul>
          <li><a href="#view-a-list-of-all-my-items">View a list of all my items</a></li>
          <li><a href="#add-an-inventory-item">Add an item to your inventory</a></li>
          <li><a href="#delete-an-inventory-item">Delete an item from your inventory</a></li>
       </ul>
         <li><a href="#create-a-shipment">Create a shipment</a>
           <ul>
          <li><a href="#view-a-list-of-all-my-shipments">View a list of all of my shipments</a></li>
            <li><a href="#edit-shipment-details">Edit details of a shipment</a></li>
            <li><a href="#add-an-item-to-a-shipment">Add items to a shipment</a></li>
            <li><a href="#delete-an-item-from-a-shipment">Delete an item from a shipment</a></li>  
         </ul> 
       </ul>
    </li>
        </ul>
        <li><a href="#schema-design">How the schema is designed</a></li>
        <li><a href="#testing">Testing</a></li>
          <ul>
            <li><a href="#rspec-testing">RSpec testing</a></li>
            <li><a href="#simplecov-testing">Simplecov testing</a></li>
          </ul>
      </details>

----------

## Getting Started

##### Versions

- Ruby 2.7.4
- Rails 5.2.7

----------

##### Gems

User Authentication [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)

API [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers) | [figaro](https://github.com/p2t2/figaro) | [faraday](https://github.com/lostisland/faraday)

Testing [rspec-rails](https://github.com/rspec/rspec-rails) | [simplecov](https://github.com/simplecov-ruby/simplecov) | [capybara](https://github.com/teamcapybara/capybara) | [webmock](https://github.com/bblimke/webmock) | [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) | [VCR](https://github.com/vcr/vcr) | [pry](https://github.com/pry/pry) | [VCR](https://github.com/vcr/vcr)

----------

##### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository:`git@github.com:wanderlust-create/whether_sweater.git`
3. Navigate to the newly cloned directory:`cd whether_sweater`
4. If bundler is not installed run:`gem install bundler`
5. To install the required Gems run:`bundle install` 
6. If errors occur, check for proper installation and versions of:`bundler`, `ruby`, and `rails`
7. Set up the database locally with:`rails db:{drop, create, migrate }`
8. Open your text editor and check to see that `schema.rb` was created.
9. You may also run the RSpec test suite locally with the command `bundle exec rspec` to ensure everything is functioning as expected.

----------

### How to use this application


[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

