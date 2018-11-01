# frozen_string_literal: true

# Decorator classes used in the tests below
class TestUserDecorator1 < ApplicationDecorator
  forward :first_name, :last_name, age: :user_age
  forward :email, to: :@contact

  def initialize(user)
    @contact = user.contact
    super
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

class TestUserDecorator2 < ApplicationDecorator
  forward_all
end

describe ApplicationDecorator do
  let(:user) do
    OpenStruct.new(
      first_name: 'Test',
      last_name: 'User',
      age: 42,
      contact: OpenStruct.new(email: 'test@example.com')
    )
  end

  describe '.forward' do
    let(:decorated_user) { TestUserDecorator1.new(user) }

    it 'forwards methods' do
      expect(decorated_user.first_name).to eq user.first_name
      expect(decorated_user.last_name).to eq user.last_name
    end

    it 'aliases methods' do
      expect(decorated_user.user_age).to eq user.age
    end

    it 'adds custom methods' do
      expect(decorated_user.full_name)
        .to eq "#{user.first_name} #{user.last_name}"
    end

    it 'can also delegate to other objects' do
      expect(decorated_user.email).to eq user.contact.email
    end
  end

  describe '.forward_all' do
    let(:decorated_user) { TestUserDecorator2.new(user) }

    it 'forwards methods' do
      expect(decorated_user.first_name).to eq user.first_name
      expect(decorated_user.last_name).to eq user.last_name
      expect(decorated_user.age).to eq user.age
    end

    it 'responds to forwarded methods' do
      expect(decorated_user.respond_to?(:first_name)).to be true
      expect(decorated_user.respond_to?(:last_name)).to be true
      expect(decorated_user.respond_to?(:age)).to be true
    end
  end

  describe '.decorate_collection' do
    it 'wraps all elements of the collection in a decorator' do
      decorated = TestUserDecorator1.decorate_collection([user, user])
      expect(decorated.size).to eq 2
      expect(decorated).to all(be_a TestUserDecorator1)
    end
  end
end
