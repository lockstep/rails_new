# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Property Uploader', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'uploads csv' do
    visit '/'
  end
end
