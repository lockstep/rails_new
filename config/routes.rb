# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  root 'dashboard#index'
  # TODO: Add root route as needed/necessary
  # unauthenticated :user do
  #   root to: 'static_pages#landing'
  # end
end
