class InventoryFoodsController < ApplicationController
  def new
    @inventory = Inventory.find(params[:id])
    @inventory_food = InventoryFood.new
  end

  def destroy
    @inventory_food = InventoryFood.find_by(id: params[:food_id])

    if @inventory_food.destroy
      flash[:notice] = 'Inventory food deleted successfully!!'
    else
      flash[:alert] = 'Inventory could not be deleted.'
    end
    redirect_to user_inventory_path(params[:id])
  end

  def create
    food_list = params[:inventory_food][:food_list]
    food_list = food_list.drop(1)
    food_list.each do |food|
      next unless InventoryFood.where(food_id: food.to_i, inventory_id: params[:id]).blank?

      new_inventory_food = InventoryFood.new(food_id: food.to_i, quantity: params[:inventory_food][:quantity],
                                             inventory_id: params[:id])
      new_inventory_food.save
    end
    redirect_to user_inventory_path(params[:id]), flash: { success: 'Inventory food has been added successfully!' }
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_list, :quantity)
  end
end
