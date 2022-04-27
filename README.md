# Weather Sweater

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

[![GitHub version](https://badge.fury.io/gh/wanderlust-create%2Fwhether_sweater.svg)](https://badge.fury.io/gh/wanderlust-create%2Fwhether_sweater)
[![PRsWelcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

### An app that exposes API endpoints to check the weather, search for restaurants, search for images, and help plan road trips. 


<h3><details open>
  <summary>Project Details</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#gems">Important Gems</a></li>
</ul> </li>

----------

## Getting Started

### Versions

- Ruby 2.7.4
- Rails 5.2.7

----------

### Gems

User Authentication [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)

API [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers) | [figaro](https://github.com/p2t2/figaro) | [faraday](https://github.com/lostisland/faraday)

Testing [rspec-rails](https://github.com/rspec/rspec-rails) | [simplecov](https://github.com/simplecov-ruby/simplecov) | [capybara](https://github.com/teamcapybara/capybara) | [webmock](https://github.com/bblimke/webmock) | [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) | [VCR](https://github.com/vcr/vcr) | [pry](https://github.com/pry/pry) | [VCR](https://github.com/vcr/vcr)

----------

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository<br>`git@github.com:wanderlust-create/whether_sweater.git`
3. Navigate to the newly cloned directory<br> `cd whether_sweater`
4. If bundler is not installed run<br> `gem install bundler`
5. To install the required Gems run<br> `bundle install` 
6. If errors occur, check for proper installation and versions of<br> `bundler`, `ruby`, and `rails`
7. Set up the database locally with<br> `rails db:{drop,create, migrate}`
8. Open your text editor and check to see that `schema.rb` was created.
9. You may also run the RSpec test suite locally with the command`bundle exec rspec` to ensure everything is functioning as expected.

----------



