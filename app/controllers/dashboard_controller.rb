class DashboardController < ApplicationController
  before_action :redirect_buyers, if: :buyer_user?
  
  def index
    @total_properties = Property.count
    @available_properties = Property.available.count
    @sold_properties = Property.sold.count
    @reserved_properties = Property.reserved.count
    @total_buyers = Buyer.count
    @recent_properties = Property.limit(5)
    @recent_buyers = Buyer.recent.limit(5)
    @colony_names = Property.distinct.pluck(:colony_name)
  end
  
  private
  
  def redirect_buyers
    redirect_to properties_path, alert: "Buyers can only view properties."
  end
  
  def buyer_user?
    current_user&.buyer_user?
  end
end
