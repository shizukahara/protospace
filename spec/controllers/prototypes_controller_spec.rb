require 'rails_helper'

describe PrototypesController, type: :controller do

    let!(:prototype) { create(:prototype) }
    let!(:params) {{
      id: prototype.id,
      prototype: attributes_for(:prototype, name: 'hoge')
    }}
    let!(:invalid_params) {{
      id: prototype.id,
      prototype: attributes_for(:prototype, name: nil)
    }}

    before do
      @user = User.first
      allow(controller)
        .to receive(:current_user)
        .and_return(@user)
    end
    #current_userのスタブを作る。before_action require_loginを通過できる。


    describe 'GET #index' do
      it 'assigns the requested prototypes to @prototypes' do
        prototypes = create_list(:prototype, 8)
        get :index
        expect(assigns(:prototypes)).to eq (prototypes.sort{ |a,b| b.created_at <=> a.created_at })
      end

      it "renders the :index template" do
        prototype = create(:prototype)
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: prototype.id
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'assigns likes associated with prototype to @likes' do
        expect(assigns(:likes)).to eq prototype.likes_count
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: prototype.id
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns main_image to @main_content' do
        expect(assigns(:main_image)).to eq prototype.thumbnails.main
      end

      it 'assigns sub_images to @sub_contents' do
        expect(assigns(:sub_images)).to eq prototype.thumbnails.sub
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end
end

