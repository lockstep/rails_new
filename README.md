# README

Template for new Rails projects.

## Getting started

To get going clone this repository and perform the following steps:

1. Clone this repository
1. You can now run `bin/configure`, which will help you in configuring the template.
   Alternatively perform all of the following steps manually.
1. Change application name in `config/application.rb`.
1. Update `database.yml` to reflect the new application name.
1. Update `TODO` items in `config/environments/production.rb`.
1. If you plan on using Figaro, copy `config/application.yml.example` to `config/application.yml`.
1. ESLint is preconfigured for modern JS with React support (AirBnB styleguide). If you want to use
   it install packages with `npm install`, otherwise remove `.eslintrc` and `package.json`.
1. If you don't plan on tracking the template, you can remove the `.git` directory.
   Otherwise you can rename the remote:
   ```shell
   $ git remote rename origin rails_new
   ```
1. Add your new remote as appropriate.

## Optional configurations

* If you want to use [AirBrake](https://airbrake.io), make sure the following 2 environment variables are set:
    * `AIRBRAKE_PROJECT_ID`
    * `AIRBRAKE_API_KEY`
* [New Relic](https://newrelic.com) is pre configured in `config/newrelic.yml`,
  but you need to comment in the environment variables for it work on Heroku
  (lines 10 and 17).

## Environment variables

| Variable              | Comment                                                                 |
| ---                   | ---                                                                     |
| GOOGLE_ANALYTICS_ID   | Will be added to the main application layout if set                     |
| BLOCK_HTTP_TRACE      | Disable HTTP TRACE method if set to true/t/1                            |
| DATABASE_URL          | Used for `production` env, automatically set by Heroku                  |
| HTTP_METHOD_BLACKLIST | If you want to block more than just TRACE, e.g. `"TRACE,OPTIONS"`       |
| PORT                  | Port Puma will listen on, defaults to 3000                              |
| RAILS_LOG_TO_STDOUT   | Set by Heroku Ruby buildpack, set manually on other platforms if needed |
| RAILS_MAX_THREADS     | Number of Puma threads, defaults to 5                                   |

## Contents

All of the following have been installed and pre-configured.

### Base system

* Rails 5.1.0
* Ruby 2.4.1
* [pg](https://github.com/ged/ruby-pg) for `ActiveRecord`
* The app is preconfigured for Google Analytics, just add `GOOGLE_ANALYTICS_ID` to the environment.

### General

* [active_model_serializers](https://github.com/rails-api/active_model_serializers)
* [draper](https://github.com/drapergem/draper)
* [figaro](https://github.com/laserlemon/figaro)
* [pundit](https://github.com/elabs/pundit)
* [secureheaders](https://github.com/twitter/secureheaders)
* [sidekiq](https://github.com/mperham/sidekiq)

### Frontend

All of these are managed by `yarn`.

* [bootstrap4](https://www.npmjs.com/package/bootstrap-v4-dev)
* [jquery](https://www.npmjs.com/package/jquery)

### Development

* [foreman](https://github.com/ddollar/foreman)
* [newrelic_rpm](https://github.com/newrelic/rpm)
* [pry](https://github.com/rweng/pry-rails)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [pry-doc](https://github.com/pry/pry-doc)
* [RuboCop](https://github.com/bbatsov/rubocop)

### Test

* [bullet](https://github.com/flyerhzm/bullet)
* [bundler-audit](https://github.com/rubysec/bundler-audit)
* [capybara](https://github.com/teamcapybara/capybara)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [devise](https://github.com/plataformatec/devise)
* [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
* [high_voltage](https://github.com/thoughtbot/high_voltage)
* [memory_profiler](https://github.com/SamSaffron/memory_profiler)
* [poltergeist](https://github.com/teampoltergeist/poltergeist)
* [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec)
* [webmock](https://github.com/bblimke/webmock)

### Production

* [airbrake](https://github.com/airbrake/airbrake)
* [heroku-deflater](https://github.com/romanbsd/heroku-deflater)
* [lograge](https://github.com/roidrage/lograge)
* [rails_12factor](https://github.com/heroku/rails_12factor)
* [rake-timeout](https://github.com/heroku/rack-timeout)

## Removed

The following default Rails gems have been removed:

* [coffee-rails](https://github.com/rails/coffee-rails)
* [jbuilder](https://github.com/rails/jbuilder)
