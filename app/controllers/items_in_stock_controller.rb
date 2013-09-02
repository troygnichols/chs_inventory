class ItemsInStockController < ApplicationController
  before_filter :load_location

  def new
    @item_in_stock = @location.items_in_stock.build

    respond_to do |format|
      format.html
      format.json { render json: @item_in_stock }
    end
  end

  def edit
    @item_in_stock = @location.items_in_stock.where(id: params[:id]).first
  end

  def create
    @item_in_stock = @location.items_in_stock.build(params[:item_in_stock])

    respond_to do |format|
      if @item_in_stock.save
        format.html { redirect_to @location }
        format.json { render json: @item_in_stock, status: :created, location: @item_in_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @item_in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item_in_stock = @location.items_in_stock.where(id: params[:id]).first

    respond_to do |format|
      if @item_in_stock.update_attributes(params[:item_in_stock])
        format.html { redirect_to @location }
        format.json { head :no_content }
      else
        ca
        format.html { render action: "edit" }
        format.json { render json: @item_in_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_in_stock = @location.items_in_stock.where(id: params[:id]).first
    @item_in_stock.destroy

    respond_to do |format|
      format.html { redirect_to @location }
      format.json { head :no_content }
    end
  end

  private

  def load_location
    @location = Location.find(params[:location_id])
  end
end
