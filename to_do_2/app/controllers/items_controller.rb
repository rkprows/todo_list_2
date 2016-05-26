class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@list = List.find(params[:list_id])
  	@item = Item.new
  end

  def create
  	@list = List.find(params[:item][:list_id])
  	@list.items.create(item_params)

  	if @list.save 
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
  		redirect_to item_path(@item)
  	else
  		render :edit
  	end
  end

  def destroy
  	@item = Item.find(params[:id]).destroy
  	redirect_to items_path
  end
end



private

def item_params
	params.require(:item).permit(:name, :description, :complete, :item_id)
end
