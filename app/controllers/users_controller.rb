class UsersController < ApplicationController
     
    before_action :set_user, except: [:index]
    
    def index
        if isAdmin
            @users = User.paginate(:page => params[:page], :per_page => 5)
        end
        
    end
    
    def show
        # @user = User.find(params[:id])
        # @rooms = @user.rooms
        @menus = @user.menus
    end
    
    def update
        
        # @user = User.find(params[:id])
        
         @user.update(user_params)
        
        redirect_to edit_user_path, notice: "Plano Atualizado"
    
    end
     def user_params
        params.require(:user).permit(:plan_id, :status)
    end
    
    def isAdmin
        
        @retorno = AdminUser.where(email: current_user.email)
        @retorno.size == 0 ? false : true
        
    end
    
    def edit
        # @user = User.find(params[:id])
        # puts @user.email
        @documents = @user.documents.where(kind: 0)
    end
    
    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'Usuário excluído' }
          format.json { head :no_content }
        end
    end
   
   private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
    
    
end