# frozen_string_literal: true

# Presenter class used in the tests below. Note that decorator base class
# behavior is not retested here.
class TestUserPresenter < ApplicationPresenter
  forward :first_name, :last_name, :age

  def formatted_first_name
    content_tag :strong, first_name
  end
end

describe ApplicationPresenter do
  let(:user) { OpenStruct.new(first_name: 'Test', last_name: 'User', age: 42) }

  describe '.call' do
    context 'without a block' do
      it 'returns the wrapped instance' do
        user_presenter = TestUserPresenter.(user)
        expect(user_presenter).to be_a(TestUserPresenter)
      end

      it 'uses imported view helpers' do
        user_presenter = TestUserPresenter.(user)
        formatted_first_name = "<strong>#{user.first_name}</strong>"
        expect(user_presenter.formatted_first_name).to eq formatted_first_name
      end
    end

    context 'with a block' do
      it 'yield the instance to the provided block' do
        expect { |block| TestUserPresenter.(user, &block) }.to yield_control
      end

      it 'returns the wrapped instance' do
        user_presenter = TestUserPresenter.(user) {} # no-op block
        expect(user_presenter).to be_a(TestUserPresenter)
      end
    end
  end

  describe '.present_collection' do
    it 'wraps all provided models in a presenter' do
      user_presenters = TestUserPresenter.present_collection([user, user])
      expect(user_presenters.size).to eq 2
      expect(user_presenters).to all(be_a(TestUserPresenter))
    end

    it 'yields each element to a provided block' do
      output = StringIO.new
      user_presenters = TestUserPresenter.present_collection([user, user]) do |u|
        output.puts(u.first_name)
      end
      output.rewind
      expect(output.string).to eq "Test\nTest\n"
      expect(user_presenters.size).to eq 2
      expect(user_presenters).to all(be_a(TestUserPresenter))
    end
  end
end
