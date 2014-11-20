require 'rails_helper'

describe UsersController, :type => :controller do
  
  describe 'GET #new' do
    it 'assigns a user to @user class variable' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    context 'when valid' do
      it 'saves the user to database' do
        expect {
          post :create, user: User.new(email: 'person@example.com').attributes
        }.to change(User, :count).by 1
      end
    end

    context 'when invalid' do
      it 'rerenders the :new template' do
        post :create, user: User.new(email: 'wrong email').attributes
        expect(response).to render_template :new
      end
    end
  end

end
