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
    - [`Account` vs `User`](#account-vs-user)
    - [Webpacker, the asset pipeline, and ES6](#webpacker-the-asset-pipeline-and-es6)
    - [Custom classes](#custom-classes)
    - [`Gemfile.dev` / `Gemfile.dev.lock`](#gemfiledev--gemfiledevlock)
    - [`Rack::RejectTrace` middleware](#rackrejecttrace-middleware)
    - [Favicons](#favicons)
- [Docker](#docker)
    - [Usage examples:](#usage-examples)
- [TODO](#todo)
- [License](#license)

## Getting started

To get going clone this repository and perform the following steps:

1. Run `rails credentials:edit` to re-generate `config/master.key` and create
   `config/credentials.yml.enc`.
1. If your application requires `ActiveStorage`, run `rails active_storage:install` to
   generate a migration that creates the necessary tables. Use `rails db:migrate` to
   run the migration.
1. You can now run `bin/configure`, which will help you in configuring the template.

As an alternative to running the script you can perform all of the following steps manually.

1. Change application name in `config/application.rb`.
1. Update `database.yml` to reflect the new application name.
1. Update `TODO` items in `config/environments/production.rb`.
1. If you plan on using Figaro, copy `config/application.yml.example` to `config/application.yml`.
2. ESLint is preconfigured for modern JS with React support (using [Prettier](https://prettier.io)).
   If you want to use it install packages with `npm install` / `yarn [install]`, otherwise remove
   `.eslintrc` and `package.json`.
3. If you don't plan on tracking the template, you can remove the remote, otherwise rename it and
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
* We prefer to use vanilla Sidekiq for worker/queue management. If you prefer
  to use ActiveJob please see the configuration/options that were removed in
  [59cf38d](https://github.com/lockstep/rails_new/commit/59cf38d5872eb8bd9267a5c0ae95aa39396c7130).

## Environment variables

| Variable                     | Comment                                                                 |
| ---------------------------- | ----------------------------------------------------------------------- |
| AIRBRAKE_PROJECT_ID          | Used in `config/initializers/airbrake.rb`                               |
| AIRBRAKE_API_KEY             | Used in `config/initializers/airbrake.rb`                               |
| BLOCK_HTTP_TRACE             | Disables HTTP `TRACE` method if set to true/t/1                         |
| BUNDLE_GEMFILE               | Useful when using a [Gemfile.dev](#gemfiledev---gemfiledevlock)         |
| DATABASE_URL                 | Used for `production` env, automatically set by Heroku                  |
| GOOGLE_ANALYTICS_ID          | Will be added to the main application layout if set                     |
| HOST                         | Your base URI, e.g. https://myapp.herokuapp.com                         |
| NEW_RELIC_APP_NAME           | Used in `config/newrelic.yml`                                           |
| NEW_RELIC_LICENSE_KEY        | Used in `config/newrelic.yml`                                           |
| PORT                         | Port Puma will listen on, defaults to 3000                              |
| RACK_TIMEOUT_SERVICE_TIMEOUT | Limit for `Rack::Timeout`, defaults to 15 seconds                       |
| RAILS_LOG_TO_STDOUT          | Set by Heroku Ruby buildpack, set manually on other platforms if needed |
| RAILS_MAX_THREADS            | Number of Puma threads, defaults to 5                                   |
| REDIS_URL                    | Used in `config/cable.yml`                                              |
| WEB_CONCURRENCY              | Number of Puma workers. We default to threads only, no workers          |

## Contents

All of the following have been installed and pre-configured:

### Base system

* Rails 5.2.1
* Ruby 2.5.1
* PostgreSQL >= 9.2
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
* [rack-timeout](https://github.com/heroku/rack-timeout): Configured via env variables, see [documentation](https://github.com/heroku/rack-timeout#configuring)
* [secureheaders](https://github.com/twitter/secureheaders)

## Removed

The following default Rails gems have been removed:

* [coffee-rails](https://github.com/rails/coffee-rails)
* [jbuilder](https://github.com/rails/jbuilder)

## Notes

### `Account` vs `User`

Authentication concerns (your typical `Devise` configuration) are handled by the `Account` model. To connect this to one of several potential user roles the polymorphic `authenticatable` relationship is used.

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

### `Gemfile.dev` / `Gemfile.dev.lock`

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

## Docker

For those wishing to use Docker for development the whole app has been dockerized and the setup is
fairly well-documented. Features:

* Images use [Alpine Linux](https://alpinelinux.org) to keep their size small.
* `docker-compose.yml` sets up and starts Postgres, Redis, Sidekiq, Rails and the Webpack dev server.
* Uses a persistent bundle cache, so there's no need to rebuild the image to add gems.
* Persistent volumes for Postgres and Redis.
* No exposed ports except for Rails (mapped to port `3000` by default)

The following files relate to our Docker setup:

* `Dockerfile`: main setup for the `app` container
* `docker-compose.yml`: Ties Postgres, Redis and `app` together
* `docker-entrypoint.sh`: Custom entry point to facilitate bundle caching
* `Procfile.docker`: Used by the entrypoint script to bring up services
* `.dockerignore`: similar to `.gitignore`, specifies files we don't want copied into the container

### Usage examples:

Start the environment and build the images if necessary:

```sh
$ docker-compose up --build
Building app
[Step 1/12 : FROM ruby:2-alpine
 ---> 8302cc790fbf
Step 2/12 : RUN apk update && apk add --update --no-cache   build-base   chromium   chromium-chromedriver   git   imagemagick   libxml2-dev   libxslt-dev   nodejs   tzdata   postgresql-dev
 ---> Using cache
 ---> 9d1d0b398c26
Step 3/12 : RUN bundle config build.nokogiri --use-system-libraries
 ---> Using cache
 ---> 0a5ca06d7700
Step 4/12 : WORKDIR /app
 ---> Using cache
 ---> c61498ba7e64
[...]
```

Start the environment without (re-)building images (add `-d` to daemonize):

```sh
$ docker-compose up
Starting rails_new_postgres_1 ... done
Starting rails_new_redis_1    ... done
Starting rails_new_app_1      ... done
Attaching to rails_new_postgres_1, rails_new_redis_1, rails_new_app_1
[...]
```

Stop the environment but keep the containers:

```sh
$ docker-compose stop
Stopping rails_new_app_1      ... done
Stopping rails_new_postgres_1 ... done
Stopping rails_new_redis_1    ... done
```

Stop the environment and remove the containers:

```sh
$ docker-compose down
Stopping rails_new_app_1      ... done
Stopping rails_new_postgres_1 ... done
Stopping rails_new_redis_1    ... done
Removing rails_new_app_1      ... done
Removing rails_new_postgres_1 ... done
Removing rails_new_redis_1    ... done
Removing network rails_new_default
```

Execute a command inside the `app` container:

```sh
$ docker-compose exec app ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-musl]
```

Execute a command inside the `app` container that needs env variables:

```sh
$ docker-compose exec --env RAILS_ENV=test app rails db:setup
Created database 'rails_new_test'
-- enable_extension("plpgsql")
   -> 0.0251s
-- create_table("users", {:force=>:cascade})
   -> 0.0366s
```

Adding a new gem (does not require image rebuild):

```sh
# update Gemfile
$ docker-compose exec app bundle
```

Running specs:

```sh
$ docker-compose exec app rspec
....................

Finished in 0.47352 seconds (files took 16.36 seconds to load)
20 examples, 0 failures
```

## TODO

Nothing right now.

## License

This project is MIT licensed, see [LICENSE](./LICENSE).
