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
    @item = Item.new(params[:item])

    # This is a really crappy way of enforcing that the tag gets assigned to
    # the first element of a list.
    @item.tags = Array.new(1) { Tag.find_by_name(params[:tag_name].first) || Tag.create(name: params[:tag_name].first) }

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
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
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
end
