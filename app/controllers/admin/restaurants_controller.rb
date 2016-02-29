class Admin::RestaurantsController < AdminController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    @menu_groups = MenuGroup.where(restaurant: @restaurant).order(:name)
    @items       = Item.where(restaurant: @restaurant).order(:name)
    @foods       = Food.where(restaurant: @restaurant).order(:name)
  end

  def new
    @restaurant = Restaurant.new
    # @restaurant.addresses.build
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_path
    else
      redirect_to edit_admin_restaurants_path, alert: @restaurant.errors.full_messages
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurants_path
    else
      redirect_to edit_admin_restaurant_path(@restaurant), alert: @restaurant.errors.full_messages
    end

  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
      # @address = @restaurant.addresses.first
    end

    def create_address

    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :slogan, :phone_number, :about, :disclaimer, :seating, :outside_seating, :cash_only,
        addresses_attributes: [:restaurant_id, :street, :city, :state, :zip, :latitude, :longitude])
    end
end
