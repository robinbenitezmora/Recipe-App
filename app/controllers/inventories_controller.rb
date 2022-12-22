class InventoriesController < ApplicationController
    # load_and_authorize_resource
    # before_action :set_inventory, only: %i[show edit update destroy]

    def index
      @inventories = Inventory.all
    end

    def show
      @inventory = Inventory.find(params[:id])
      @foods = @inventory.inventory_foods.includes(:food)
      @foody = Food.all
      @inventory_food = InventoryFood.new
    end

    def new
      @inventories = Inventory.new
    end

    def create
      @inventory = Inventory.new(inventory_params)
      @inventory.user_id = current_user.id

      respond_to do |format|
        if @inventory.save
          format.html { redirect_to inventories_url(@inventory), notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @inventory }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @inventory.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @inventory = Inventory.find(params[:id])
      authorize! :destroy, @inventory
      @inventory.destroy!

      respond_to do |format|
        format.html { redirect_to inventories_url, notice: 'Inventory successfully deleted.' }
      end
    end

    private

    def inventory_params
      params.require(:inventory).permit(:name, :description)
    end
  end
