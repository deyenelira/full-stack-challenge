require 'rails_helper'
require_relative "../support/devise"

RSpec.describe UsersController, type: :controller do 
  
  login_user

  describe 'GET /users' do 
    it 'returns success status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'returns success status' do
      user = FactoryBot.create(:user)
      get :show, params: { :id => user.id } 
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /users/:id' do
    scenario 'valid user attributes' do
      user = FactoryBot.create(:user)
      put :update, params: {
        id: user.id,
        user: {
          email: 'day@sample.com'
        }
      }
      expect(response).to have_http_status(302)
    end

    scenario 'invalid user attributes' do
      user = FactoryBot.create(:user)
      put :update, params: {
        id: user.id,
        user: {
          email: ''
        }
      }
      expect(response).to have_http_status(422)
    end
  end

  describe 'POST /users' do
    scenario 'valid user attributes' do
      post :create, params: {
        user: {
          email: 'test@sample.com',
          password: '123456789'
        }
      }
      expect(response).to have_http_status(302)
    end

    scenario 'invalid user attributes' do
      post :create, params: {
        user: {
          email: '',
          password: '123456789'
        }
      }
      expect(response).to have_http_status(422)
    end
  end
end
