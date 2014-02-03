class ItemsController < ApplicationController
  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @item }
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html
      format.json { render json: @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    Item.transaction do
      @item = Item.new(item_params)
      @item.tags = [find_or_create_tag(params[:tag][:name])] unless params[:tag][:name].blank?
    end

    respond_to do |format|
      if @item.save
        flash[:success] = "Created #{@item.name}."
        format.html { redirect_to action: 'index' }
        format.json { render json: @item, status: :created, location: @item }
      else
        flash[:error] = "Cannot create #{@item.name}."
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    Item.transaction do
      @item = Item.find(params[:id])
      @item.tags = [find_or_create_tag(params[:tag][:name])]
    end

    respond_to do |format|
      if @item.update_attributes(item_params)
        flash[:success] = "Updated #{@item.name}."
        format.html { redirect_to action: 'index' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private

  def find_or_create_tag(name)
    Tag.find_by_name(name) || Tag.create(name: name) 
  end

  def item_params
    params.require(:item).permit(:name, :size, :units)
  end
end
