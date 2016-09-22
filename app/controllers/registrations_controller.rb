class RegistrationsController < Devise::RegistrationsController

	def update
		 
		 
		 logger.debug("update **************************************")
		 logger.debug(@user.fullname)
		 logger.debug(user_params)
		 logger.debug(resource_name)
		if @user.update(user_params)
		
		  if params[:images] 
	        params[:images].each do |image|
	        	
	          @user.documents.create(image: image)
	          logger.debug("olarrrrr")
	          logger.debug("*****************************")
	        end
	      end
	
    	@documents = @user.documents
		  
		 redirect_to edit_user_registration_url, notice: "Updated..."
		else
		  render :edit,notice: "Dados não atualizados"
		end
	end
  
	def user_params
		params.require(:user).permit(:fullname, :rg, :cpf, :miniCurriculo, :images, :document)
	end
	
	def show
	    @documents = @user.documents
	    logger.debug("show **************************************")
	end
	
	def edit
		@documents = @user.documents
		@document = Document.new
		logger.debug("edit **************************************")
	end
	
	protected
		def update_resource(resource, params)
			resource.update_without_password(params)
		end
end

