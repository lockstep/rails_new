# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!
end
