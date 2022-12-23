class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @foods = current_user.foods
    @inventories = Inventory.all
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    @recipes = Recipe.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to 
    if @recipe.save
      format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      format.json { render :show, status: :created, location: @recipe }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end

  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparationtime, :cookingtime, :description, :public)
  end
end
