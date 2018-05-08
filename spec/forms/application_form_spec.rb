# frozen_string_literal: true

# Test form classes used below
class TestUser < User; end

class TestUserForm < ApplicationForm; end

class SignupForm < ApplicationForm
  resource_class TestUser

  form_attributes :name

  validates :name, presence: true
end

describe ApplicationForm do
  context 'class methods' do
    describe '.resource_class' do
      it 'correctly infers the model name' do
        expect(TestUserForm.resource_class).to eq TestUser
      end

      it 'uses an explicitly specified model name' do
        expect(SignupForm.resource_class).to eq TestUser
      end
    end

    describe '.model_name' do
      it 'returns the resource class as ActiveModel::Name' do
        expect(TestUserForm.model_name).to be_a(ActiveModel::Name)
      end
    end
  end

  context 'instance methods' do
    describe '#resource' do
      it 'returns the resource wrapped by the form object' do
        form = TestUserForm.new(User.new, email: 'test@example.com')
        expect(form.resource).to be_a(User)
      end
    end
  end

  context 'delegation' do
    it 'delegates the persisted? method to the wrapped object' do
      form = TestUserForm.new(User.new, email: 'test@example.com')
      expect(form.persisted?).to be false
    end
  end

  context 'validations' do
    it 'is valid if the form and resource are valid' do
      user = TestUser.new(email: 'test@example.com', password: 's3cr3t!')
      params = ActionController::Parameters.new(name: 'Test User').permit(:name)
      form = SignupForm.new(user, params)

      expect(form).to be_valid
      expect(form.resource).to be_valid
      expect(user).to receive(:save!)
      form.save
    end

    it 'is invalid if a form validation fails' do
      form = SignupForm.new

      expect(form).not_to be_valid
      expect(form.errors[:name]).to be_present
    end

    it 'propagates errors of the wrapped resource' do
      params = ActionController::Parameters.new(name: 'Test User').permit(:name)
      form = SignupForm.new(TestUser.new, params)

      expect(form.save).to be false
      expect(form.errors[:email]).to be_present
      expect(form.errors[:password]).to be_present
    end
  end
end
