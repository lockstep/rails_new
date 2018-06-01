
# rails_new &nbsp; [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Save%20hours%20of%20your%E2%8F%B1%EF%B8%8F%20with%20this%20template%20for%20building%20modern%20%23Rails%20apps%20%F0%9F%92%AF%F0%9F%94%A5%20&url=https://github.com/lockstep/rails_new&via=locksteplabs&hashtags=rubyonrails)

![Build Status](https://circleci.com/gh/lockstep/rails_new.svg?style=shield)

A thoughtfully designed template for building modern Rails apps 🔥

Get started on your new app within minutes instead of hours 🚗💨

- [Getting started](#getting-started)
- [Optional configuration options](#optional-configuration-options)
- [Environment variables](#environment-variables)
- [Contents](#contents)
  - [Base system](#base-system)
  - [General](#general)
  - [Frontend](#frontend)
  - [Development](#development)
  - [Test](#test)
  - [Production](#production)
- [Removed](#removed)
- [Notes](#notes)
  - [Webpacker, the asset pipeline, and ES6](#webpacker--the-asset-pipeline--and-es6)
  - [Custom classes](#custom-classes)
  - [Gemfile.dev / Gemfile.dev.lock](#gemfiledev---gemfiledevlock)
  - [`Rack::RejectTrace` middleware](#rack--rejecttrace-middleware)
  - [Favicons](#favicons)

## Getting started

To get going clone this repository and perform the following steps:

1. Run `rails credentials:edit` to re-generate `config/master.key` and create
   `config/credentials.yml.enc`.
1. Run `rails active_storage:install` to generate a migration that creates
   active storage tables. Use `rails db:migrate` to run the migration.
1. You can now run `bin/configure`, which will help you in configuring the template.

As an alternative to running the script you can perform all of the following steps manually.

1. Change application name in `config/application.rb`.
1. Update `database.yml` to reflect the new application name.
1. Update `TODO` items in `config/environments/production.rb`.
1. If you plan on using Figaro, copy `config/application.yml.example` to `config/application.yml`.
1. ESLint is preconfigured for modern JS with React support ([AirBnB styleguide](https://github.com/airbnb/javascript)).
   If you want to use it install packages with `npm install` / `yarn [install]`, otherwise remove
   `.eslintrc` and `package.json`.
1. If you don't plan on tracking the template, you can remove the remote, otherwise rename it and
   add your new remote as appropriate.:
   ```shell
   $ git remote rename origin rails_new
   $ git remote add origin ...
   ```

## Optional configuration options

* If you want to use [AirBrake](https://airbrake.io), make sure the following 2 environment
  variables are set:
    * `AIRBRAKE_PROJECT_ID`
    * `AIRBRAKE_API_KEY`
* [New Relic](https://newrelic.com) is pre configured in `config/newrelic.yml`, but you need to
  comment in the environment variables for it work on Heroku (lines 10 and 17).
* The app is preconfigured for Google Analytics, just add `GOOGLE_ANALYTICS_ID` to the environment.

## Environment variables

| Variable              | Comment                                                                 |
|-----------------------|-------------------------------------------------------------------------|
| AIRBRAKE_PROJECT_ID   | Used in `config/initializers/airbrake.rb`                               |
| AIRBRAKE_API_KEY      | Used in `config/initializers/airbrake.rb`                               |
| BLOCK_HTTP_TRACE      | Disables HTTP `TRACE` method if set to true/t/1                         |
| BUNDLE_GEMFILE        | Useful when using a [Gemfile.dev](#gemfiledev---gemfiledevlock)         |
| DATABASE_URL          | Used for `production` env, automatically set by Heroku                  |
| GOOGLE_ANALYTICS_ID   | Will be added to the main application layout if set                     |
| HOST                  | Your base URI, e.g. https://myapp.herokuapp.com                         |
| NEW_RELIC_APP_NAME    | Used in `config/newrelic.yml`                                           |
| NEW_RELIC_LICENSE_KEY | Used in `config/newrelic.yml`                                           |
| PORT                  | Port Puma will listen on, defaults to 3000                              |
| RAILS_LOG_TO_STDOUT   | Set by Heroku Ruby buildpack, set manually on other platforms if needed |
| RAILS_MAX_THREADS     | Number of Puma threads, defaults to 5                                   |
| REDIS_URL             | Used in `config/cable.yml`                                              |
| WEB_CONCURRENCY       | Number of Puma workers. We default to threads only, no workers          |

## Contents

All of the following have been installed and pre-configured:

### Base system

* Rails 5.2.0
* Ruby 2.5.1
* [pg](https://github.com/ged/ruby-pg) for `ActiveRecord`

### General

* [devise](https://github.com/plataformatec/devise)
* [figaro](https://github.com/laserlemon/figaro)
* [foreman](https://github.com/ddollar/foreman)
* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi)
* [pundit](https://github.com/elabs/pundit)
* [sidekiq](https://github.com/mperham/sidekiq)

### Frontend

All of these are managed by `yarn`.

* [bootstrap4](https://www.npmjs.com/package/bootstrap-v4-dev)
* [jquery](https://www.npmjs.com/package/jquery)
* [jquery-ujs](https://www.npmjs.com/package/jquery-ujs/)
* [popper.js](https://www.npmjs.com/package/popper.js)

### Development

* [Brakeman](https://github.com/presidentbeef/brakeman)
* [bullet](https://github.com/flyerhzm/bullet)
* [letter_opener](https://github.com/ryanb/letter_opener)
* [memory_profiler](https://github.com/SamSaffron/memory_profiler)
* [newrelic_rpm](https://github.com/newrelic/rpm)
* [nullalign](https://github.com/tcopeland/nullalign)
* [pry](https://github.com/rweng/pry-rails)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [pry-doc](https://github.com/pry/pry-doc)
* [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler)
* [RuboCop](https://github.com/bbatsov/rubocop)

### Test

Rspec has been preconfigured for Rails 5.1+ system tests.

* No need to `require 'rails_helper`, we do it in `.rspec`
* [bundler-audit](https://github.com/rubysec/bundler-audit) (runs on CircleCI)
* [capybara](https://github.com/teamcapybara/capybara)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec)
* [webmock](https://github.com/bblimke/webmock)

### Production

* [airbrake](https://github.com/airbrake/airbrake)
* [heroku-deflater](https://github.com/romanbsd/heroku-deflater)
* [lograge](https://github.com/roidrage/lograge)
* [rails_12factor](https://github.com/heroku/rails_12factor)
* [rake-timeout](https://github.com/heroku/rack-timeout)
* [secureheaders](https://github.com/twitter/secureheaders)

## Removed

The following default Rails gems have been removed:

* [coffee-rails](https://github.com/rails/coffee-rails)
* [jbuilder](https://github.com/rails/jbuilder)

## Notes

### Webpacker, the asset pipeline, and ES6

By default ES6 will not work for files in `app/assets/javascript` since Uglifier will fail to
process them. This is why we applied the following change to `config/production.rb`, which allows
you to use ES6 project wide:

```diff
-  config.assets.js_compressor = :uglifier
+  config.assets.js_compressor = Uglifier.new(harmony: true)
```

Also note that for everything to work properly on Heroku, you need to set up your buildpacks like
this:

```
heroku buildpacks:clear
heroku buildpacks:set heroku/nodejs
heroku buildpacks:add heroku/ruby
```

### Custom classes

* `ApplicationDecorator`: lightweight alternative to Draper or similar gems.
* `ApplicationForm`: Minimal form class based on `ActiveModel`.
* `ApplicationPresenter`: a subclass of `ApplicationDecorator` for presenters, includes tag helpers.

All custom classes are fully documented with [yard](https://yardoc.org) and come with generators.

Use `yard doc` to generate documentation and `yard server --reload` or `yard server --gems` to start
a local documentation server.

### Gemfile.dev / Gemfile.dev.lock

If you want to add specific gems for development that may not be interesting for other developers,
you can add a `Gemfile.dev` (ignored by our `.gitignore`). Gems listed there can be installed with
`bundle install --gemfile Gemfile.dev` and the resulting lock file is gitignored too.

Example `Gemfile.dev`:

```ruby
source 'https://rubygems.org'

eval_gemfile 'Gemfile'

gem 'awesome_print'
```

The `eval_gemfile` line will ensure that all gems from your regular `Gemfile` will be included too.
The `BUNDLE_GEMFILE` variable can be used to let Bundler now which gemfile to use:

```
BUNDLE_GEMFILE=Gemfile.dev rails c
```

### `Rack::RejectTrace` middleware

There's a custom middleware (`Rack::RejectTrace`) for completely disabling the HTTP TRACE method as
required by certain security audits. It can be enabled via the `BLOCK_HTTP_TRACE` environment
variable.

### Favicons

Favicons were generated with [Real Favicon Generator](https://realfavicongenerator.net/), consider
using the same tool when replacing them for your project.
