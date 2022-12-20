require 'rails_helper'

RSpec.describe "/foods", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Food.create! valid_attributes
      get foods_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      food = Food.create! valid_attributes
      get food_url(food)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      food = Food.create! valid_attributes
      get edit_food_url(food)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Food" do
        expect {
          post foods_url, params: { food: valid_attributes }
        }.to change(Food, :count).by(1)
      end

      it "redirects to the created food" do
        post foods_url, params: { food: valid_attributes }
        expect(response).to redirect_to(food_url(Food.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Food" do
        expect {
          post foods_url, params: { food: invalid_attributes }
        }.to change(Food, :count).by(0)
      end

      it "renders a response with 422 status" do
        post foods_url, params: { food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested food" do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: new_attributes }
        food.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the food" do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: new_attributes }
        food.reload
        expect(response).to redirect_to(food_url(food))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested food" do
      food = Food.create! valid_attributes
      expect {
        delete food_url(food)
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the foods list" do
      food = Food.create! valid_attributes
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
