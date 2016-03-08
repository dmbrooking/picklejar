require 'rails_helper'

describe RecipesController, :type => :controller do
  include_context 'a_user_and_his_recipes'
  before { login_as(user) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecipeUrlsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context 'GET' do
    describe '#index' do

      it 'assigns all recipes as @recipes' do
        recipe = create(:recipe)
        get :index
        expect(assigns(:recipes)).to eq([recipe])
      end
    end
  end

  context 'POST' do
    describe '#create' do

      before(:each) do
        allow_any_instance_of(RecipeSource).to receive(:get_hostname).and_return('www.epicurious.com')
      end

      describe 'with valid params' do
        it 'creates a new Recipe' do
          recipe = build(:recipe)
          expect {
            post :create, {params: {:url => recipe.url}}, valid_session
          }.to change(Recipe, :count).by(1)
        end

        it 'assigns a newly created recipe as @recipe' do
          recipe = build(:recipe)
          post :create, {params: {:url => recipe.url}}, valid_session
          expect(assigns(:recipe)).to be_a(Recipe)
          expect(assigns(:recipe)).to be_persisted
        end

        it 'persists the new recipe to the database' do
          recipe = build(:recipe)
          post :create, {params: {:url => recipe.url, :title => recipe.title}}, valid_session

          # confirm that recipe persisted
          persistedRecipes = Recipe.where(url: recipe.url, title: recipe.title)
          expect(persistedRecipes).to_not be_nil
          expect(persistedRecipes.to_a.length).to eq(1)
          expect(persistedRecipes.to_a[0].url).to eq(recipe.url)
          expect(persistedRecipes.to_a[0].title).to eq(recipe.title)
        end

        it 'persists the hostname to the database' do
          recipe = build(:recipe)
          post :create, {params: {:url => recipe.url}}, valid_session

          # confirm that hostname persisted
          persistedHostname = Hostname.where(hostname: 'www.epicurious.com')
          expect(persistedHostname).to_not be_nil
          expect(persistedHostname.to_a.length).to eq(1)
          expect(persistedHostname.to_a[0].hostname).to eq('www.epicurious.com')
        end

        it 'persists relation between hostname and recipe' do
          recipe = build(:recipe)
          post :create, {params: {:url => recipe.url, :title => recipe.title}}, valid_session

          persistedRecipes = Recipe.where(url: recipe.url, title: recipe.title)
          persistedHostname = Hostname.where(hostname: 'www.epicurious.com')
          expect(persistedRecipes.to_a[0].hostname.hostname).to eq('www.epicurious.com')
          expect(persistedRecipes.to_a[0].hostname_id).to eq(persistedHostname.to_a[0].id)
        end

        it 'redirect to the create recipe' do
          recipe = build(:recipe)
          post :create, {params: {:url => recipe.url}}, valid_session
          expect(response).to redirect_to(Recipe.last)
        end

      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved recipe_url as @recipe_url' do
          recipe = build(:invalidRecipe)
          post :create, {:url => recipe.url}, valid_session
          expect(assigns(:recipe)).to be_a_new(Recipe)
        end

        it 're-renders the "new" template' do
          recipe = build(:invalidRecipe)
          post :create, {:url => recipe.url}, valid_session
          expect(response).to render_template('new')
        end
      end
    end
  end
#
#   context 'PUT' do
#     describe '#update' do
#       describe "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }
#
#       it "updates the requested recipe_url"
#       it "assigns the requested recipe_url as @recipe_url"
#       it "redirects to the recipe_url"
#
#       #do
#       #   recipe_url = RecipeUrl.create! valid_attributes
#       #   put :update, {:id => recipe_url.to_param, :recipe_url => new_attributes}, valid_session
#       #   recipe_url.reload
#       #   skip("Add assertions for updated state")
#       # end
#
#
#
#       #do
#       #   recipe_url = RecipeUrl.create! valid_attributes
#       #   put :update, {:id => recipe_url.to_param, :recipe_url => valid_attributes}, valid_session
#       #   expect(assigns(:recipe_url)).to eq(recipe_url)
#       # end
#
#
#
#       #do
#       #   recipe_url = RecipeUrl.create! valid_attributes
#       #   put :update, {:id => recipe_url.to_param, :recipe_url => valid_attributes}, valid_session
#       #   expect(response).to redirect_to(recipe_url)
#       # end
#     end
#
#     describe "with invalid params" do
#       it "assigns the recipe_url as @recipe_url"
#       it "re-renders the 'edit' template"
#
#       #do
#       #   recipe_url = RecipeUrl.create! valid_attributes
#       #   put :update, {:id => recipe_url.to_param, :recipe_url => invalid_attributes}, valid_session
#       #   expect(assigns(:recipe_url)).to eq(recipe_url)
#       # end
#
#
#       #do
#       #   recipe_url = RecipeUrl.create! valid_attributes
#       #   put :update, {:id => recipe_url.to_param, :recipe_url => invalid_attributes}, valid_session
#       #   expect(response).to render_template("edit")
#       # end
#     end
#   end
# end
#
#   describe "DELETE destroy" do
#     it "destroys the requested recipe_url"
#     it "redirects to the recipe_urls list"
#
#     #do
#     #   recipe_url = RecipeUrl.create! valid_attributes
#     #   expect {
#     #     delete :destroy, {:id => recipe_url.to_param}, valid_session
#     #   }.to change(RecipeUrl, :count).by(-1)
#     # end
#
#      #do
#     #   recipe_url = RecipeUrl.create! valid_attributes
#     #   delete :destroy, {:id => recipe_url.to_param}, valid_session
#     #   expect(response).to redirect_to(recipe_urls_url)
#     # end
#   end
end
