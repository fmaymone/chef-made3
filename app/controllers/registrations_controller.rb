class RegistrationsController < Devise::RegistrationsController
	def update
		 logger.debug("update **************************************")
		if @user.update(user_params)
		
		  if params[:images] 
	        params[:images].each do |image|
	          @user.photos.create(image: image)
	          logger.debug("olarrrrr")
	          logger.debug("*****************************")
	        end
	      end
	
      @photos = @user.photos
		  
		  render:edit, notice: "Dados atualizados"
		else
		  render :edit,notice: "Dados não atualizados"
		end
	end
  
	def user_params
		params.require(:user).permit(:fullname, :rg, :cpf)
	end
	
	def show
	    @photos = @user.photos
	     logger.debug("show **************************************")
	end
	
	def edit
		@photos = @user.photos
		 logger.debug("edit **************************************")
	end
	
	protected
		def update_resource(resource, params)
			resource.update_without_password(params)
		end
end