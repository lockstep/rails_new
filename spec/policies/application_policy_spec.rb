# frozen_string_literal: true

class TestUser < User; end
class TestUserPresenter < ApplicationPresenter; end

describe ApplicationPolicy do
  it 'implicitly unwraps decorators and presenters' do
    current_user = User.new
    presented_user = TestUser.new
    user_presenter = TestUserPresenter.new(presented_user)
    policy = described_class.new(current_user, user_presenter)
    expect(policy.record).to eq(presented_user)
  end
end
