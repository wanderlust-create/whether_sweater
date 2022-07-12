<img src="https://user-images.githubusercontent.com/67713820/172872889-7ec2bc87-2bd9-4c1b-b9a9-d2b18bda244e.png" alt="logo" max-width="600"><br>

# Weather Sweater

![rails-badge](https://img.shields.io/badge/Rails-5.2.8-blue) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.4-orange)
[![GitHub version](https://badge.fury.io/gh/wanderlust-create%2Fwhether_sweater.svg)](https://badge.fury.io/gh/wanderlust-create%whether_sweater)
[![PRsWelcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

### Learning Goals for this project:
Explicit
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

Implicit
- Project planning
- Reading/Writing documentation
- Time Management/Prioritizing Work
- Break down large project goals into manageable steps
- GitHub workflow and project management tools


reference: [Project Specs and Overview](https://backend.turing.edu/module3/projects/sweater_weather/)


### My Online Store application details
### Table of Contents</summary>
  <ol>
    <li>
      <details open>
      <summary>Getting Started</summary>
      <ul>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#gems">Important Gems</a></li>
        <li><a href="#set-up">Set Up</a></li>
        <li><a href="#data-returned-from-api">Data returned from API endpoints</a></li>
      </ul>
        </li>
    <li></details>
     <details open>
      <summary>Whether Sweater API Avaliable Endpoints</summary>
      <ul>
        <li><a href="#weather-forecast-for-application-landing-page">Weather forecast for Application Landing Page</a></li>
          <li><a href="#city-background-image">City background image</a></li>
          <li><a href="#user-registration">User registration</a></li>
          <li><a href="#user-login">User login</a></li>
          <li><a href="#road-trip">Road Trip</a></li>
          <li><a href="#munchies">Munchies</a></li>
      </ul>
        </li>
    <li></details>
        <details open>
      <summary>Testing</summary>
      <ul>
            <li><a href="#rspec-testing">RSpec testing</a></li>
            <li><a href="#simplecov-testing">Simplecov testing</a></li>
              </ul>
        </li>
    <li></details>
      <a href="#schema-details">Schema Details</a></li>
      <li><a href="#contributor">Contributer</a></li>

----------

### Getting Started

#### Versions

- Ruby 2.7.4
- Rails 5.2.7

----------

#### Gems

User Authentication | [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) |

API | [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers) | [figaro](https://github.com/p2t2/figaro) | [faraday](https://github.com/lostisland/faraday) |

Testing | [rspec-rails](https://github.com/rspec/rspec-rails) | [simplecov](https://github.com/simplecov-ruby/simplecov) | [capybara](https://github.com/teamcapybara/capybara) | [webmock](https://github.com/bblimke/webmock) | [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) | [VCR](https://github.com/vcr/vcr) | [pry](https://github.com/pry/pry) |

----------
#### API key registerations needed: currently, all registerations and data access needed to run this app is free

-[MapQuest Directions & Geolocation API](https://developer.mapquest.com/documentation)<br>
-[OpenWeather API](https://openweathermap.org/faq)<br>
-[Unsplash photographs API](https://unsplash.com/documentation)<br>
-[Yelp Fusion API](https://www.yelp.com/developers/documentation/v3/get_started)<br>

----------

### Set Up: 
You will need to apply for your own unique API keys from the above API data providers<br>
On your local system, open a terminal session to run the following commands:
1. Clone this repository:`git@github.com:wanderlust-create/whether_sweater.git`
3. Navigate to the newly cloned directory:`cd whether_sweater`
4. If bundler is not installed run:`gem install bundler`
5. To install the required Gems run:`bundle install`
6. If errors occur, check for proper installation and versions of:`bundler`, `ruby`, and `rails`
7. Add file to store your unique API keys:`touch config/application.yml`, `atom config/application.yml`
8. Add your unique API keys to the `/config/application.yml` file as follows:<br>
```
map_key: your unique MapQuest API key 
open_key: your unique OpenWeather API key
un_ac: your unique Unsplash API key
YELP_API_KEY: Bearer your unique Yelp Fusion API key
```
9. Set up the database locally with:`rails db:{drop, create, migrate }`
10. Open your text editor and check to see that `schema.rb` was created.
11. You may also run the RSpec test suite locally with the command `bundle exec rspec` to ensure everything is functioning as expected.

----------

### Data returned from API:
- Retrieve current, daily, and hourly weather for a specific location
- Retrieve a landscape-oriented photo for a specific location
- Ability to create an account and generate a unique api key that can be used to access the road trip API
- Ability to create a 'road trip', using a unique AP key, that will return an estimated travel time between two given cities and the anticipated weather when you arrive.
- Retrieve travel time between two given destinations: along with the anticipated current weather current for your arrival time and restaurant info for your destination city.

----------

### Whether Sweater API Avaliable Endpoints: [See Postman Documentation](https://documenter.getpostman.com/view/20045145/UzJQqZiU)
<br><br>

## 🌤
#### Weather Forecast for Application Landing Page  
| http verb | uri | params | example | outcome |
| --- | --- | --- | --- | --- |
| GET | /forecast | location | /api/v1/forecast?location=San Jose, CA | Returns current/5 daily/8 hourly weather data for requested location |

Data consumed from [Open Weather API](https://openweathermap.org/api)

<details>
  <summary> JSON response example </summary>

Weather Forecast JSON response:
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-07-11 17:46:22 UTC",
                "sunrise": "2022-07-11 12:56:04 UTC",
                "sunset": "2022-07-12 03:29:40 UTC",
                "temperature": 82.69,
                "feels_like": 82.6,
                "humidity": 44,
                "uvi": 7.64,
                "visibility": 10000,
                "conditions": "smoke",
                "icon": "50d"
            },
            "daily_weather": [
                {
                    "date": "2022-07-11 20:00:00 UTC",
                    "sunrise": "2022-07-11 12:56:04 UTC",
                    "sunset": "2022-07-12 03:29:40 UTC",
                    "max_temp": 96.57,
                    "min_temp": 65.43,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "date": "2022-07-12 20:00:00 UTC",
                    "sunrise": "2022-07-12 12:56:42 UTC",
                    "sunset": "2022-07-13 03:29:16 UTC",
                    "max_temp": 92.82,
                    "min_temp": 59.05,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-07-13 20:00:00 UTC",
                    "sunrise": "2022-07-13 12:57:22 UTC",
                    "sunset": "2022-07-14 03:28:51 UTC",
                    "max_temp": 93.02,
                    "min_temp": 56.75,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-07-14 20:00:00 UTC",
                    "sunrise": "2022-07-14 12:58:03 UTC",
                    "sunset": "2022-07-15 03:28:23 UTC",
                    "max_temp": 93.65,
                    "min_temp": 59.5,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-07-15 20:00:00 UTC",
                    "sunrise": "2022-07-15 12:58:44 UTC",
                    "sunset": "2022-07-16 03:27:54 UTC",
                    "max_temp": 95.95,
                    "min_temp": 59.34,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "2022-07-11 17:00:00 UTC",
                    "temperature": 83.73,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "2022-07-11 18:00:00 UTC",
                    "temperature": 82.69,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "2022-07-11 19:00:00 UTC",
                    "temperature": 85.17,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "2022-07-11 20:00:00 UTC",
                    "temperature": 88.39,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "2022-07-11 21:00:00 UTC",
                    "temperature": 91.74,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "2022-07-11 22:00:00 UTC",
                    "temperature": 94.78,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "2022-07-11 23:00:00 UTC",
                    "temperature": 96.98,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "2022-07-12 00:00:00 UTC",
                    "temperature": 94.89,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
```
</details>
<br>

## 📸
#### City background image
| http verb | uri | params | example | outcome |
| --- | --- | --- | --- | --- |
| GET | /backgrounds | location | /api/v1/backgrounds?location=savannah | Returns landscape-oriented image of requested location |

Data consumed from [Unsplash API](https://unsplash.com/documentation)

<details>
  <summary> JSON response example </summary>

Background Image JSON response:
```json
  {
    "data": {
        "type": "image",
        "id": "9h2CRu-lqyw",
        "attributes": {
            "image": {
                "location": "savannah\n",
                "image_url": "https://images.unsplash.com/photo-1510496667864-dad10bbf57d9?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMjI0MTl8MHwxfHNlYXJjaHwxfHxzYXZhbm5haCUwQWxhbmRzY2FwZXxlbnwwfDB8fHwxNjU3NTU2Mjg2&ixlib=rb-1.2.1&q=80",
                "credit": {
                    "source": "https://unsplash.com",
                    "photographer": "Jose Llamas",
                    "portfolio": "https://unsplash.com/photos/9h2CRu-lqyw",
                    "Guidelines and Crediting": "https://unsplash.com/documentation#guidelines--crediting"
                }
            }
        }
    }
}

```
</details>
<br>

##  🙇🏽‍♀️
#### User registration
| http verb | uri | details | outcome |
| --- | --- | --- | --- |
| POST | /users | Include email, password, & password confirmation in body as raw JSON data (see example below)  | Returns user id and unique API key |

<details>
  <summary> JSON request body and response examples </summary>

Register user request body:
```json
{
  "email": "leapingLama@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Register user response:
```json
{
    "data": {
        "type": "users",
        "id": 12,
        "attributes": {
            "email": "leapingLama@example.com",
            "api_key": {unique API key returned}
        }
    }
}
```
</details>
<br>

## 👩🏾‍💻
#### User login
| http verb | uri | details | outcome |
| --- | --- | --- | --- |
| POST | /sessions | Include email, & password in body as raw JSON data (see example below)  | Returns user id, email, and user's unique API key |

<details>
  <summary> JSON request body and response examples </summary>

User login request body:
```json
{
  "email": "leapingLama@example.com",
  "password": "password"
}
```

User login response:
```json
{
    "data": {
        "type": "users",
        "id": 12,
        "attributes": {
            "email": "leapingLama@example.com",
            "api_key": {unique API key returned}
        }
    }
}
```
</details>
<br>

## 🗺
#### Road Trip
Data consumed from | [Open Weather API](https://openweathermap.org/api) | [Mapquest Directions API](https://developer.mapquest.com/documentation/directions-api/) |
| http verb | uri | details | outcome |
| --- | --- | --- | --- |
| POST | /road_trip | Include origin, destination, & user's unique API key in body as raw JSON data (see example below)  | Returns estimated trip time & weather at eta |
<details>
  <summary> JSON request body and response examples </summary>

User login request body:
```json
{
  "origin": "Atlanta, GA",
  "destination": "New York, NY",
  "api_key": {user's unique API key}
}
```

User login response:
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Atlanta, GA",
            "end_city": "New York, NY",
            "travel_time": "13 hours, 50 min",
            "weather_at_eta": {
                "temperature": 72.27,
                "conditions": "clear sky"
            }
        }
    }
}
```
</details>
<br>

## 🌮
#### Munchies
Data consumed from | [Open Weather API](https://openweathermap.org/api) | [Mapquest Directions API](https://developer.mapquest.com/documentation/directions-api/) | [Yelp Fusion API](https://www.yelp.com/developers/documentation/v3/get_started)
| http verb | uri | params | example | outcome |
| --- | --- | --- | --- | --- |
| GET | /munchies | start, destination | /api/v1/munchies?start=Mexico City&destination=Colima, Mexico | Returns estimated travel time, weather forecast at eta, & a restaurant in your destination location |

<details>
  <summary> JSON response example </summary>

Munchie JSON response:
```json
{
    "data": {
        "id": null,
        "type": "munchie",
        "attributes": {
            "destination_city": "Colima, Mexico",
            "travel_time": "7 hours, 12 min",
            "forecast": {
                "summary": "scattered clouds",
                "temperature": "82"
            },
            "restaurant": {
                "name": "Chepe",
                "address": "Amado Nervo 726-B Col. La Armonia 28020 Colima Mexico"
            }
        }
    }
}
```
</details>
<br><br>

----------

## Testing

Whether Sweater was created using Test Driven Development methodology.


#### RSpec testing
Run test suite using `bundle exec rspec`. All tests are currently passing passing.
<img src="https://user-images.githubusercontent.com/67713820/178348089-597a04d7-9b26-43e9-b10c-ba37774604d4.png" alt="RSpec" max-width="200"><br><br>


#### Simplecov testing

Simplecov shows 100% code testing coverage.
<img src="https://user-images.githubusercontent.com/67713820/178348512-bbe1de7c-5a49-48f5-95e0-afcd954af1b4.png" alt="simplecov" max-width="200"><br><br>

----------

## Schema Details

<img src="https://user-images.githubusercontent.com/67713820/178355520-f2b5d1b1-9fd9-4083-a473-d0f1f9c239ae.png" alt="simplecov" max-width="200"><br><br>
----------

## Contributor
💻 Tamara Dowis |  [Github](https://github.com/wanderlust-create)  |  [LinkedIn](https://www.linkedin.com/in/tamara-dowis/)



----------
## Practies & Process:
![OOP](https://user-images.githubusercontent.com/64919819/113648808-77684300-964a-11eb-8575-05aeaa946a6f.png)
![TDD](https://user-images.githubusercontent.com/64919819/113648827-7f27e780-964a-11eb-8f9e-dfdc2ed077c5.png)
![MVC](https://user-images.githubusercontent.com/64919819/113648848-8949e600-964a-11eb-833f-91872b6f3fe0.png)
![REST](https://user-images.githubusercontent.com/64919819/113648856-8ea73080-964a-11eb-8e85-6f580a54eaca.png)<br>
[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)
