class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @professionals = current_user.professionals
  end

  def show
    @photos = @professional.photos
    
    @booked = Reservation.where("professional_id = ? AND user_id = ?", @professional.id, current_user.id).present? if current_user

    @reviews = @professional.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @professional = current_user.professionals.build
  end

  def create
    @professional = current_user.professionals.build(professional_params)

    if @professional.save

      if params[:images] 
        params[:images].each do |image|
          @professional.photos.create(image: image)
        end
      end

      @photos = @professional.photos
      redirect_to edit_professional_path(@professional), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    if current_user.id == @professional.user.id
      @photos = @professional.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @professional.update(professional_params)

      if params[:images] 
        params[:images].each do |image|
          @professional.photos.create(image: image)
        end
      end

      redirect_to edit_professional_path(@professional), notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_professional
      @professional = Professional.find(params[:id]) 
    end

    def professional_params
      params.require(:professional).permit(:home_type, :professional_type, :accommodate, :bed_professional, :bath_professional, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end
