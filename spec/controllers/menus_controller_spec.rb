require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of menus starting with the letter" do
        nasi_goreng = FactoryBot.create(:menu, name: "Nasi Goreng")
        telur = FactoryBot.create(:menu, name: "Telur")
        get :index, params: { letter: 'Go' }
        expect(assigns(:menus)).to match_array([nasi_goreng])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'Na' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all menus" do 
        nasi_goreng = FactoryBot.create(:menu, name: "Nasi Goreng")
        mie_goreng = FactoryBot.create(:menu, name: "Mie Goreng")
        get :index
        expect(assigns(:menus)).to match_array([nasi_goreng, mie_goreng])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end
  
  describe 'GET #show' do
    it "assigns the requested menu to @menu" do
      menu = FactoryBot.create(:menu)
      get :show, params: { id: menu }
      expect(assigns(:menu)).to eq menu
    end

    it "renders the :show template" do
      menu = FactoryBot.create(:menu)
      get :show, params: { id: menu }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Menu to @menu" do
      get :new
      expect(assigns(:menu)).to be_a_new(Menu)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested menu to @menu" do
      menu = FactoryBot.create(:menu)
      get :edit, params: { id: menu }
      expect(assigns(:menu)).to eq menu
    end

    it "renders the :edit template" do
      menu = FactoryBot.create(:menu)
      get :edit, params: { id: menu }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new menu in the database" do
        expect{
          post :create, params: { menu: attributes_for(:menu, category_ids: ["1", "2"]) }
        }.to change(Menu, :count).by(1)
      end

      it "redirects to menus#show" do
        post :create, params: { menu: attributes_for(:menu, category_ids: ["1", "2"]) }
        expect(response).to redirect_to(menu_path(assigns[:menu]))
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new menu in the database" do
        expect{
          post :create, params: { menu: attributes_for(:menu, name: nil, category_ids: ["1", "2"]) }
        }.not_to change(Menu, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { menu: attributes_for(:menu, name: nil, category_ids: ["1", "2"]) }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH #update' do
    before :each do
      @menu = FactoryBot.create(:menu)
    end

    context "with valid attributes" do
      it "locates the requested @menu" do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, name: 'Nasi Uduk', category_ids: ["1", "2"]) }
        expect(assigns(:menu)).to eq @menu
      end

      it "changes @menu's attributes" do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, name: 'Nasi Uduk', category_ids: ["1", "2"]) }
        @menu.reload
        expect(@menu.name).to eq('Nasi Uduk')
      end

      it "redirects to the menu" do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, category_ids: ["1", "2"]) }
        expect(response).to redirect_to @menu
      end
    end

    context 'with invalid attributes' do
      it 'does not save the updated menu in the database' do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, name: 'Nasi Uduk', price: "Test", category_ids: ["1", "2"]) }
        expect(@menu.name).not_to eq('Nasi Uduk')
      end

      it 're-renders the edit template' do
        patch :update, params: { id: @menu, menu: attributes_for(:menu, name: nil, category_ids: ["1", "2"]) }
        expect(assigns(:menu)).to eq @menu
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before :each do
      @menu = FactoryBot.create(:menu)
    end

    it "deletes the menu from the database" do
      expect{
        delete :destroy, params: { id: @menu }
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to menus#index" do
      delete :destroy, params: { id: @menu }
      expect(response).to redirect_to menus_url
    end
  end
end