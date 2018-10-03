# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { '1234test' }
  end
end
