class RegistrationsController < Devise::RegistrationsController

	def update

		if @user.update(user_params)
		
		  if params[:images] 
	        params[:images].each do |image|
	        
	          @user.documents.create(image: image)
	         
	        end
	      end
	
    	@documents = @user.documents.where("kind = 0")
		  
		 redirect_to edit_user_registration_path, notice: "Atualizado..."
		else
		  render :edit,notice: "Dados não atualizados"
		end
	end
  
	def user_params
		params.require(:user).permit(:fullname, :rg, :cpf, :miniCurriculo, :images, :document, :address, :kind, :plan_id, :description, :phone_number,:password, :password_confirmation, :current_password)
	end
	
	def show
	   	@documents = @user.documents.where("kind = 0")
	    
	end
	
	def edit
		@documents = @user.documents.where("kind = 0")
		@document = Document.new
		@document.kind = :documentos
		
	end
	
	protected
		def update_resource(resource, params)
			resource.update_without_password(params)
		end
end

