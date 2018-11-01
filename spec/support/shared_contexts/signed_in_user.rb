# frozen_string_literal: true

RSpec.shared_context 'signed in user' do
  include Warden::Test::Helpers

  before do
    Warden.test_mode!
    login_as(Account.find_by(authenticatable: @user), scope: :account)
  end

  after do
    Warden.test_reset!
  end
end
