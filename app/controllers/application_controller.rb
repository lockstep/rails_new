# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  helper_method :current_user

  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken do
    flash[:alert] = I18n.t('app.authenticity_token_expired')
    redirect_back fallback_location: root_path, allow_other_host: false
  end

  before_action :authenticate_account!

  private

  # A shorthand for passing locals to views, avoiding implicitly passed instance
  # variables.
  #
  # The following calls are equivalent to each other:
  #   render action: :new, locals: { the_anser: 42 }
  #   expose :new, the_answer: 42
  #
  #   render locals: { the_anser: 42 }
  #   expose the_anser: 42
  #
  # @param action [Symbol] action to render, only necessary if not default
  # @param locals [Hash<Symbol, Object>] locals to be passed to the view
  # @return [void]
  def expose(action = nil, **locals)
    render action: action, locals: locals
  end

  def current_user
    @current_user ||= current_account&.authenticatable
  end
end
