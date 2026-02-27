class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :filter_properties, only: [:index]

  def index
    @properties = @properties.order(created_at: :desc)
    @available_count = Property.available.count
    @sold_count = Property.sold.count
    @reserved_count = Property.reserved.count
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      if params[:property][:images]
        params[:property][:images].each do |image|
          @property.images.attach(image) if image.present?
        end
      end
      redirect_to @property, notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      if params[:property][:images]
        params[:property][:images].each do |image|
          @property.images.attach(image) if image.present?
        end
      end
      redirect_to @property, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy!
    redirect_to properties_url, notice: "Property was successfully destroyed."
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
  
  def filter_properties
    # Buyers can only see available properties
    if current_user&.buyer_user?
      @properties = Property.available
    else
      @properties = Property.all
    end
  end

  def property_params
    params.require(:property).permit(:title, :colony_name, :plot_number, :size, :price, :status, :description, images: [])
  end
end
