class ColonyMapController < ApplicationController
  def index
    @colony_names = Property.distinct.pluck(:colony_name)
    @selected_colony = params[:colony] || @colony_names.first
    @properties = @selected_colony ? Property.by_colony(@selected_colony) : Property.all
  end

  def show
    @colony_name = params[:colony_name]
    @properties = Property.by_colony(@colony_name)
  end
end
