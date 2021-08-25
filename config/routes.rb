# frozen_string_literal: true

Rails.application.routes.draw do
  resources :properties, only: [:index] do
    collection do
      post 'csv_upload', to: 'properties/csv_upload#create'
    end
  end
  devise_for :accounts

  root 'dashboard#index'
  # TODO: Add root route as needed/necessary
  # unauthenticated :user do
  #   root to: 'static_pages#landing'
  # end
end
