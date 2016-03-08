require "rails_helper"

describe RecipeSource, :type => :model do

  it { should respond_to(:get_title) }
  it { should respond_to(:get_hostname) }

  context 'when given a valid URL' do

    it 'should parse the correct title' do
      recipeSource = RecipeSource.new('http://www.epicurious.com/articlesguides/bestof/toprecipes/bestsalmonrecipes/recipes/food/views/Poached-Salmon-Fillets-with-Watercress-Mayonnaise-106950')
      expect(recipeSource.get_title).to eq 'Poached Salmon Fillets with Watercress Mayonnaise recipe | Epicurious.com'
    end

    it 'should parse the correct host' do
      recipeSource = RecipeSource.new('http://www.epicurious.com/articlesguides/bestof/toprecipes/bestsalmonrecipes/recipes/food/views/Poached-Salmon-Fillets-with-Watercress-Mayonnaise-106950')
      expect(recipeSource.get_hostname).to eq 'www.epicurious.com'
    end

  end
end
