require 'rails_helper'

describe UsersController do
  let!(:user) { create(:user) }
  let(:params) {{
  id: user.id,
  user: attributes_for(:user, name: 'hoge')
  }}




    describe 'GET #show' do
      before do
        get :show, id: user
      end

      it "assigns the requested contact to @user" do
        expect(assigns(:user)).to eq user
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: user
      end

      it "assings the requested contact to @user" do
        expect(assigns(:user)).to eq user
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before do
        patch :update, params
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it "changes user's attribtues" do
        user.reload
        expect(user.name).to eq "hoge"
      end

      it 'redirects root_path' do
        expect(response).to redirect_to root_path
      end
    end


end
