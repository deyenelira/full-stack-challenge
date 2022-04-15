require 'rails_helper'
require_relative "../support/devise"

RSpec.describe LendsController, type: :controller do 
  
  login_user

  describe 'GET /lends' do 
    it 'returns success status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /lends/:id' do
    it 'returns success status' do
      lend = FactoryBot.create(:lend)
      get :show, params: { :id => lend.id } 
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /lends/:id' do
    scenario 'valid lend attributes' do
      lend = FactoryBot.create(:lend)
      put :update, params: {
        id: lend.id,
        lend: {
          return_date: lend.created_at + 2.months
        }
      }
      expect(response).to have_http_status(302)
    end

    scenario 'invalid lend attributes' do
      lend = FactoryBot.create(:lend)
      put :update, params: {
        id: lend.id,
        lend: {
          return_date: lend.created_at + 6.months + 1.day
        }
      }
      expect(response).to have_http_status(422)
    end
  end

  describe 'POST /lends' do
    scenario 'valid lend attributes' do
      book = FactoryBot.create(:book)
      user = FactoryBot.create(:user)
      post :create, params: {
        lend: {
          book_id: book.id,
          user_id: user.id,
          return_date: DateTime.now + 1.month
        }
      }
      expect(response).to have_http_status(302)
    end
  end
end
