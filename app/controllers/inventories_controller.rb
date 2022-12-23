class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show destroy]
  before_action :authenticate_user!, only: %i[new create destroy]

  def new
    @inventory = Inventory.new
  end

  def index
    @inventories = Inventory.all
  end

  def show
    @foods = @inventory.inventory_foods.includes(:food)
  end

  def create
    @inventory = Inventory.new(new_inventory_params)
    @inventory.user = current_user

    if @inventory.save
      flash[:notice] = 'Inventory created successfully!'
      redirect_to user_inventories_path
    else
      flash.now[:alert] = 'Inventory could not be created.'
      render :new
    end
  end

  def destroy
    if @inventory.destroy
      flash[:notice] = 'Inventory deleted successfully!'
    else
      flash[:alert] = 'Something unexpected happened, inventory could not be deleted.'
    end
    redirect_to user_inventories_path
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def new_inventory_params
    params.require(:inventory).permit(:name)
  end
end
