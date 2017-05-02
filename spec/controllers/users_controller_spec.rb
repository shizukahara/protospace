require 'rails_helper'

describe UsersController do
  let!(:user) { create(:user) }
  let(:params) {{
  id: user.id,
  user: attributes_for(:user, name: 'hoge')
  }}


#current_userのスタブ
  before do
  @user = User.first
  allow(controller)
    .to receive(:current_user)
    .and_return(@user)
  end






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

      it "changes user's attribtues" do
        user = create(:user, nickname: "shizuka")
        patch :update, id: user, user: attributes_for(:user)
        user.reload
        expect(user.nickname).to eq 'shizuka'
      end

      it 'redirects root path' do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to user_path
      end



    end


end
