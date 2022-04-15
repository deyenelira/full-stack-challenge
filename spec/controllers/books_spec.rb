require 'rails_helper'
require_relative "../support/devise"

RSpec.describe BooksController, type: :controller do 
  
  login_user

  describe 'GET /books' do 
    it 'returns success status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /books/:id' do
    it 'returns success status' do
      book = FactoryBot.create(:book)
      get :show, params: { :id => book.id } 
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /books/:id' do
    scenario 'valid book attributes' do
      book = FactoryBot.create(:book)
      put :update, params: {
        id: book.id,
        book: {
          name: Faker::Book.title
        }
      }
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /books' do
    scenario 'valid book attributes' do
      post :create, params: {
        book: {
          name: Faker::Book.title,
          author: Faker::Book.author
        }
      }
      expect(response).to have_http_status(302)
    end
  end
end
