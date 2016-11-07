class PagesController < ApplicationController
  def home
  # 	@menus = Menu.limit(3)
    
  	homeUsers
  end
  def cadastrar
    puts "cadastrar"
  end
  
  def homeUsers
  # 	@users = User.where(:plan_id => 2).limit(3)
    @users = User.where(:status => User.professional)
  end

  def search
  	
  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@user_address = User.near(session[:loc_search], 5, order: 'distance')
  	
  	
  	else
  	  "Session Nao Funcionou"
  		@user_address = User.all
  	end
    
    
  # 	@user_address = User.all
  	@arrMenus = Array.new
   
    @user_address.each do |user|
      user.menus.each do |menu|
      
        @arrMenus.push(menu)
      	
      end
    end 
    
    @search = Menu.ransack(params[:q])
  	@menus = @search.result
	  
  	
  	
  @arrMenus.each do |menu|

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		

  			not_available = menu.reservations.where(
  					"(? <= start_date AND start_date <= ?)
  					OR (? <= end_date AND end_date <= ?) 
  					OR (start_date < ? AND ? < end_date)",
  					start_date, end_date,
  					start_date, end_date,
  					start_date, end_date
  				).limit(1)
      
        
        
        
  			
  			if not_available.length > 0
  				@arrMenus.delete(menu)	
  			end	

  		end
  	 if params[:q]
  	  low = 0 
  	  high = 100000000
  	  
  	  if params[:q][:price_lteq].to_i > 0
  	    low = params[:q][:price_lteq].to_i
  	  end
  	  
  	  if params[:q][:price_gteq].to_i > 0
  	    high = params[:q][:price_gteq].to_i
  	  end
  	  
  	  
  	    puts "O preço minimo é " + low.to_s
        puts "O preço maximo é " + high.to_s
        puts "O preço do menu é " + menu.price.to_s
        # if params[:q][:price_lteq].to_i < menu.price ||params[:q][:price_gteq].to_i > menu.price
        #   puts "O menu vai ser removido da lista " 
        #   @arrMenus.delete(menu)	
        # else
        #   puts "O menu vai permanecer" 
        # end
        if menu.price.between?(low, high)
          puts "O menu vai permanecer" 
        else
          puts "O menu vai ser removido da lista " 
          @arrMenus.delete(menu)	
        end
      
      end
  	end

  end
  
 
end
