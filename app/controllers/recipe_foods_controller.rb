class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe_foods = RecipeFood.all
  end

  def show; end

  def new
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
  end
  def edit; end

  def create
    food_list = params[:recipe_food][:food_list]
    food_list = food_list.drop(1)
    food_list.each do |food|
      next unless RecipeFood.where(food_id: food.to_i, recipe_id: params[:id]).blank?

      new_recipe_food = RecipeFood.new(food_id: food.to_i, quantity: params[:recipe_food][:quantity],
                                       recipe_id: params[:id])
      new_recipe_food.save
    end
    redirect_to user_recipe_path(params[:id]), flash: { success: 'Recipe food has been added successfully!' }
  end

  # def create
  #   @recipe_food = RecipeFood.new(recipe_food_params)

  #   respond_to do |format|
  #     if @recipe_food.save
  #       format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully created.' }
  #       format.json { render :show, status: :created, location: @recipe_food }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
