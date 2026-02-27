class BuyersController < ApplicationController
  before_action :set_buyer, only: %i[show edit update destroy]

  def index
    @buyers = Buyer.recent.includes(:property)
  end

  def show
  end

  def new
    @buyer = Buyer.new
    @properties = Property.available.order(:title)
  end

  def edit
    @properties = Property.available.order(:title)
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.save
      # Update property status to sold
      @buyer.property.update(status: 'sold')
      redirect_to @buyer, notice: "Buyer was successfully created."
    else
      @properties = Property.available.order(:title)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: "Buyer was successfully updated."
    else
      @properties = Property.available.order(:title)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @buyer.destroy!
    redirect_to buyers_url, notice: "Buyer was successfully destroyed."
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.require(:buyer).permit(:name, :phone, :property_id, :sale_price, :purchase_date, :review)
  end
end
