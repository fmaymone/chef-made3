class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        # @rooms = @user.rooms
        @menus = @user.menus
    end
    
   
    
    
end