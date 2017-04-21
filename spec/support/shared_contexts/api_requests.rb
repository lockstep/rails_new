# frozen_string_literal: true

shared_examples 'a successful resource request' do |root|
  it 'returns an OK (200) status code' do
    expect(response.status).to eq(200)
  end

  it 'returns the resource' do
    expect(response_json[root]).to be_a Hash
  end
end

shared_examples 'a successful resource list request' do |root|
  it 'returns an OK (200) status code' do
    expect(response.status).to eq(200)
  end

  it 'returns the resource list' do
    expect(response_json[root]).to be_a Array
  end
end

shared_examples 'a successful resource create' do |root|
  it 'returns a Created (201) status code' do
    expect(response.status).to eq(201)
  end

  it 'returns the new resource' do
    expect(response_json[root]).to be_a Hash
  end
end

shared_examples 'an unsuccessful resource create' do
  it 'returns an Unprocessable Entity (422) status code' do
    expect(response.status).to eq(422)
  end
end

shared_examples 'an unsuccessful resource update' do
  it 'returns an Unprocessable Entity (422) status code' do
    expect(response.status).to eq(422)
  end
end

shared_examples 'an unauthorized request' do
  it 'returns an Unauthorized (401) response code' do
    expect(response.status).to be 401
  end
end

shared_examples 'a forbidden request' do
  it 'returns a Forbidden (403) status code' do
    expect(response.status).to be 403
  end
end

shared_examples 'a resource was not found' do
  it 'returns a Not Found (404) status code' do
    expect(response.status).to be 404
  end
end
