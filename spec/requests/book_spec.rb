require 'rails_helper'
require 'faker'

RSpec.describe 'Books', type: :request do
  let(:params) do
    {
      'title' => 'New Title',
      'author' => 'New author',
      'published_year' => '01.01.2000'
    }
  end
  let(:book) { create(:book) }

  describe 'POST api/v1/book/create' do
    it 'returns http created' do
      post '/api/v1/books', params: params
      expect(response).to have_http_status(:created)

      body = JSON.parse(response.body)
      result = JSON.parse(body['result'])

      expect(result['title']).to eq('New Title')
      expect(result['author']).to eq('New author')
      expect(result['published_year']).to eq('01.01.2000')
    end
  end

  describe 'GET /api/v1/books/:id' do
    it 'returns http success' do
      get "/api/v1/books/#{book.id}"
      expect(response).to have_http_status(:success)

      body = JSON.parse(response.body)
      result = JSON.parse(body['result'])

      expect(result['title']).to eq(book.title)
      expect(result['author']).to eq(book.author)
      expect(result['published_year']).to eq(book.published_year)
    end
  end

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/book/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/book/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/book/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
