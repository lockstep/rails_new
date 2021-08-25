# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UploadProperties', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'upload prperty csv' do
    get '/'
  end
end
