class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @menus = current_user.menus
    
  end

  
  def show
    @documents = @menu.documents
    
    
  end

  # GET /menus/new
  def new
     @menu = current_user.menus.build
    # redirect_to @menu

     
  end

  # GET /menus/1/edit
  def edit
    
    if current_user.id == @menu.user.id
    
      @documents = @menu.documents
		  @document = Document.new
		  @document.kind = :cardapio
		  @document.menu_id =  @menu.id
		
    
    else
      redirect_to root_path, notice: "Você não tem permissão"
    end
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.user = current_user
    
   
   

    respond_to do |format|
      if @menu.save
        if params[:images] 
	        params[:images].each do |image|
	        	
	          @menu.documents.create(image: image)
	         
	         
	        end
	      end
	      @documents = @menu.documents
	      
        format.html { redirect_to edit_menu_path(@menu), notice: 'Menu foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    puts "**************************************************"
    puts params
    puts "**************************************************"
    respond_to do |format|
      if @menu.update(menu_params)
        
        logger.debug(@menu.title)
		 
		 
    		  if params[:images] 
    	        params[:images].each do |image|
    	        	
    	          @menu.documents.create(image: image)
    	          @menu.documents.kind = :cardapio
    	     
    	        end
    	   end
    	
        	@documents = @menu.documents
            
   
        format.html { redirect_to @menu, notice: 'Menu atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
     params.require(:menu).permit(:description, :title, :entrada, :principal, :sobremesa ,:kind, :menu_id, tag_ids: []  )
     
    end
    
    def updateMenuTag
     puts "*************updateMenuTag"
     puts params[:menu]
     puts "*************updateMenuTag"
      if params[:tag_ids] 
	       # params[:tags].each do |tag|
	        	
	       # 	@menu_tag = MenuTag.new
	       # 	@menu_tag.user = current_user
	       # 	@menu_tag.tag = tag
	       # 	@menu_tag.save
	          
	          
	       # end
	      end
    end
end
