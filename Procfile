web: DB_POOL=$RAILS_MAX_THREADS bundle exec puma -C config/puma.rb
worker: DB_POOL=$WORKER_CONCURRENCY bundle exec sidekiq -C config/sidekiq.yml
