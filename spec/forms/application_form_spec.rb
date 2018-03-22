# frozen_string_literal: true

# Test form classes used below
class UserForm < ApplicationForm ; end

class SignupForm < ApplicationForm
  resource_class User
end

describe ApplicationForm do
  context 'class methods' do
    describe '.resource_class' do
      it 'correctly infers the model name' do
        expect(UserForm.resource_class).to eq User
      end

      it 'uses an explicitly specified model name' do
        expect(SignupForm.resource_class).to eq User
      end
    end

    describe '.model_name' do
      it 'returns the resource class as ActiveModel::Name' do
        expect(UserForm.model_name).to be_a(ActiveModel::Name)
      end
    end
  end

  context 'instance methods' do
    describe '#resource' do
      it 'returns the resource wrapped by the form object' do
        form = UserForm.new(User.new, email: 'test@example.com')
        expect(form.resource).to be_a(User)
      end
    end
  end

  context 'delegation' do
    it 'delegates the persisted? method to the wrapped object' do
      form = UserForm.new(User.new, email: 'test@example.com')
      expect(form.persisted?).to be false
    end
  end
end
