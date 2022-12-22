class InventoryFoodsController < ApplicationController
    load_and_authorize_resource :inventory
    load_and_authorize_resource :inventory_food, through: :inventory
  
    def index
      @inventory_foods = InventoryFood.all
    end
  
    def new
      @inventory_food = InventoryFood.new
      @foods = Food.all
      @current_inventory = Inventory.find(params[:inventory_id])
    end
  
    def create
      @current_inventory = Inventory.find(params[:inventory_id])
      @inventory_food = @current_inventory.inventory_foods.new(inventory_food_params)
  
      respond_to do |format|
        if @inventory_food.save
          format.html { redirect_to inventory_path(@current_inventory.id), notice: 'Inventory food created successfully' }
        else
          format.html { render :new, status: :unprocessable_entity, notice: 'Inventory food an error occured' }
        end
      end
    end
  
    def destroy
      @inventory_food = InventoryFood.find(params[:id])
      authorize! :destroy, @inventory_food
      @inventory_food.destroy!
  
      respond_to do |format|
        format.html { redirect_to inventory_url, notice: 'Inventory food successfully deleted.' }
      end
    end
  
    private
  
    def inventory_food_params
      params.require(:inventory_foods).permit(:food_id, :quantity)
    end
  end
  