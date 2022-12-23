# class RecipesController < ApplicationController
#   before_action :set_recipe, only: %i[show edit update destroy]

#   def index
#     @recipes = Recipe.where(user_id: current_user.id)
#   end

#   def show; end

#   def new
#     @recipe = Recipe.new
#   end

#   def edit; end

#   def update
#     respond_to do |format|
#       if @recipe.update(recipe_params)
#         format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
#         format.json { render :show, status: :ok, location: @recipe }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @recipe.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @recipe.destroy
#     respond_to do |format|
#       format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private

#   def set_recipe
#     @recipe = Recipe.find(params[:id])
#   end

#   def recipe_params
#     params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
#   end
# end
class RecipesController < ApplicationController
  def load_and_authorize_resource
    load_resource
    authorize_resource
  end

  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    # @user = User.find(params[:user_id])
    @recipes = Recipe.new
  end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   @recipe.user_id = current_user.id

  #   if @recipe.save
  #     redirect_to user_recipes_path
  #   else
  #     render :new
  #   end
  # end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_recipes_path
  end

  def show
    @foods = @recipe.recipe_foods.includes(:food)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
