# frozen_string_literal: true

include Warden::Test::Helpers

RSpec.shared_context 'signed in user' do
  before do
    Warden.test_mode!
    login_as(@user, scope: :user)
  end

  after(:each) do
    Warden.test_reset!
  end
end
