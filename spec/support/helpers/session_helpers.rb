# frozen_string_literal: true

module SpecHelpers
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit(new_user_registration_path)
      fill_in('Email', with: email)
      fill_in('Password', with: password)
      fill_in('Password confirmation', with: confirmation)
      click_button('Sign up')
    end

    def sign_in(email, password)
      visit(new_user_session_path)
      fill_in('Email', with: email)
      fill_in('Password', with: password)
      click_button('Log in')
    end

    def fill_sign_in_form(email, password)
      fill_in('Email', with: email)
      fill_in('Password', with: password)
    end
  end
end
