class EventsController < ApplicationController
 
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @events = current_user.events
  end

  def show
   
    @photos = @event.photos
  
  end

  def new
    @event = current_user.events.build
    
  end

  def create
    @event = current_user.events.build(events_param)
    
    if @event.save
      if params[:images]
        params[:images].each do |image|
          @event.photos.create(image: image)
        end
      end
    
      @photos = @event.photos
      redirect_to edit_event_path(@event), notice: "Salvo"
    else
      flash[:alert] = "Por favor forneça todos os dados necessários pro evento"
      render :new
    end
  end

  def update
    
    if @event.update(events_param)
      
        if params[:images]
        params[:images].each do |image|
          @event.photos.create(image: image)
        end
      end
    
      
      redirect_to edit_event_path(@event), notice: "Atualizado"
    else
      flash[:alert] = "Por favor forneça todos os dados necessários pro evento"
      render :edit
    end
  end
  
  def edit
    if current_user.id == @event.user.id
      @photos = @event.photos
    else
      redirect_to root_path, notice: "Você não tem permissão para acessar estas fotos"
    end
  end
  
  private
    def set_event
       @event = Event.find(params[:id])
    end
    def events_param
       params.require(:event).permit(
         :event_type,
         :number_people,
         :date_event,
         :event_name,
         :summary,
         :is_public,
         :address,
         :price,
         :active  
         
         )
       
    end
  
end
