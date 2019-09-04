# frozen_string_literal: true

describe Account do
  it 'sends transactional emails asynchronously' do
    account = described_class.find_by(authenticatable: create(:user))
    expect { account.send_reset_password_instructions }
      .to change(Sidekiq::Queues['mailers'], :size).by 1
  end
end
