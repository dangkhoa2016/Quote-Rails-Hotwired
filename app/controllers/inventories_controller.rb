class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1
  def show
  end

  # GET /inventories/new
  def new
    if params[:quote_id]
      @quotes = [current_company.quotes.find(params[:quote_id])]
    else
      @quotes = current_company.quotes
    end

    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
    @quotes = current_company.quotes
  end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to @inventory, notice: "Inventory was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: "Inventory was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy!
    redirect_to inventories_url, notice: "Inventory was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:quantity, :location, :purchase_date,
    :purchase_price, :expiration_date, :manufacturer,
    :serial_number, :notes, :quote_id)
  end
end
