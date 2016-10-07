class PagesController < ApplicationController
  def home
  	@menus = Menu.limit(3)
  	homeUsers
  end
  
  def homeUsers
  	puts "****************************************"
  	@users = User.where(:plan_id => 2).limit(3)
  	puts @users.last.email
  	puts "****************************************"
  end

  def search
  	
  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@menus_address = Menu.user.near(session[:loc_search], 5, order: 'distance')
  		puts "Session Funcionou"
  		puts @menu_adress
  	else
  	  "Session Nao Funcionou"
  		@menus_address = Menu.all
  	end

  	@search = @menus_address.ransack(params[:q])
  	@menus = @search.result

  	@arrMenus = @menus.to_a

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		@menus.each do |menu|

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

  	end

  end
end
