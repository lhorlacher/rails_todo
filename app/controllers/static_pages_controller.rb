class StaticPagesController < ApplicationController
  
  def home
  	@list_items_ns = ListItem.all.where(status: 'Not Started').count
  	@list_items_ip = ListItem.all.where(status: 'In-Progress').count
  	@list_items_c = ListItem.all.where(status: 'Complete').count
  end

  def congrats
  end


end
