require 'rails_helper'

describe 'landing page' do
  scenario 'user visits the landing page' do
    visit '/'

    expect(page).to have_text('Landing page')
  end
end
