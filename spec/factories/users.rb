# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    after(:create) do |user, _evaluator|
      create(:account, authenticatable: user)
    end
  end
end
