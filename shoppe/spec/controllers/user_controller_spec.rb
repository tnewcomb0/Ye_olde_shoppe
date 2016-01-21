require 'rails_helper'

describe UsersController do

  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end
  end

  describe 'user create' do
    context 'when given valid params' do
      let :user_params do
        {username: 'trev',
         first_name: 'trev',
         last_name: 'trev',
         email: 'trev@gmail.com',
         password: 'trev'}
       end
       it 'should create the user and redirect to root page' do
        expect{
          post :create, {user: user_params}
          }.to change{User.count}.by(1)
        end
      end
    context 'when given invalid params' do
      let :user_params do
         {first_name: 'trev',
         last_name: 'trev',
         email: 'trev@gmail.com',
         password: 'trev'}
      end
      it 'should not create the user and throw an error message' do
        expect{
          post :create, user: user_params
        }.to_not change{User.count}
      end
    end
  end
end





























  # let(:user) { FactoryGirl.create :user}
  # let(:attributes) { FactoryGirl.attributes_for :user}
  # let(:user) {User.create!(first_name: 'abe', last_name: 'abe', email:'abe@abe.com', password: 'abe', username: 'abe', admin: false)}
  # let(:admin) {User.create!(first_name: 'trev', last_name: 'trev', email:'trev@trev.com', password: 'trev', username: 'trev', admin: true)}

  # describe "GET #index" do
  #   before(:each) do
  #     get :index
  #   end
  #   it "responds with a 200" do
  #     expect(response.status).to eq(200)
  #   end
  #   it "assigns the users instance variable" do
  #     expect(assigns(:users)).to be_a(ActiveRecord::Relation)
  #   end
  #   it "assigns the user instance variable" do
  #     expect(assigns(:user)).to be_a(User)
  #   end

  #   pending "redirects unless you are an Admin"
  # end

  # describe 'POST #create' do
  #   it "saves a new article in the database" do
  #     expect{
  #     post :create, :article => attributes}.to change{ Article.count}.by(1)
  #   end
  #   it "redirects to the root path" do
  #     post :create, :article => attributes
  #     expect(response.status).to eq(302)
  #   end
  # end
  # describe 'GET #show' do
  #   before(:each) do
  #     get :show, id: article.id
  #   end
  #   it "assigns the article instance variable" do
  #     expect(assigns(:article)).to be_a(Article)
  #   end
  # end
  # describe 'PUT #update' do
  #   let!(:title) { "A treatise on Malomars." }
  #   it 'updates a field on an article' do
  #     put :update, id: article.id, article: { title: title, body: article.body }
  #     expect(article.reload.title).to eq(article.title)
  #   end
  # end
  # describe 'DELETE #destroy' do
  #   it 'decrements articles by one' do
  #     article_id = article.id
  #     expect {
  #       delete :destroy, id: article_id
  #     }.to change{ Article.count }.by(-1)
  #   end
  #   it 'redirects to the root path' do
  #     article_id = article.id
  #     delete :destroy, id: article_id
  #     expect(response.status).to eq(302)
  #   end
  # end

# end
