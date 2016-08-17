class ListItemsController < ApplicationController
  def index
  	@list_items_ns = ListItem.all.where(status: 'Not Started').order(:priority)
  	@list_items_ip = ListItem.all.where(status: 'In-Progress').order(:priority)
  	@list_items_c = ListItem.all.where(status: 'Complete').order(:priority)

  end

  def new
  	@list_item = ListItem.new
  end

  def edit
  	@list_item = ListItem.find(params[:id])
  end

  def create
  	@list_item = ListItem.new(list_item_params)

  	if @list_item.save
  	  redirect_to list_items_path
  	else
  	  render :new
  	end
  end

  def update
  	@list_item = ListItem.find(params[:id])

  	if @list_item.update(list_item_params) && params[:list_item][:status] == 'Complete'
  	  redirect_to congrats_path
    elsif @list_item.update(list_item_params)
      redirect_to list_items_path
	  else
	  render :edit
	  end
  end

  def destroy
  	@list_item = ListItem.find(params[:id])
  	@list_item.destroy
  	redirect_to list_items_path
  end

  private

  def list_item_params
  	params.require(:list_item).permit(:name, :description, :priority, :status)
  end

end
