require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end
  end

describe 'category create' do
    context 'when given valid params' do
      let :category_params do
        {title: 'trev'}
       end
       it 'should create the category and redirect to category index' do
        expect{
          post :create, category: category_params
          }.to change{Category.count}.by(1)
        end
      end
    context 'when given invalid params' do
      let :category_params do
        {title: ''}
       end
      it 'should not create the category and throw an error message' do
        expect{
          post :create, category: category_params
        }.to_not change{Category.count}
      end
    end


  describe 'category edit' do
    context 'when given valid params' do
      let :category do Category.create(title: 'hveavhb')
      end
      let! (:title) {"trev"}
         it 'updates category title' do
          put :update, id: category.id, category: { title: title }
      expect(category.reload.title).to eq(category.title)
    end
  end


end
      #  it 'should create the category and redirect to category index' do
      #   expect{
      #     post :update, category: category_params
      #     }.to change{@category.title}.from('change').to('trev')
      #   end
      # end
    # context 'when given invalid params' do
    #   let :category_params do
    #     {title: ''}
    #    end
    #   it 'should not create the category and throw an error message' do
    #     expect{
    #       post :create, category: category_params
    #     }.to_not change{Category.count}
    #   end
    # end
  end
end

