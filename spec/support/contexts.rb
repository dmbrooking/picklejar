shared_context 'a_user_and_his_recipes' do
  let(:user) { create(:user) }
  let(:hostname) { build_stubbed(:hostname) }
  let(:recipe) { create(:recipe, hostname: hostname, user: user) }
end
