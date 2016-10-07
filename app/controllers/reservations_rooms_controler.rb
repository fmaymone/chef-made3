class ReservationsRoomsController < ApplicationController	
	before_action :authenticate_user!

	def preload
		
		menu = Menu.find(params[:menu_id])
		today = Date.today
		reservations = menu.reservations.where("start_date >= ? OR end_date >= ?", today, today)

		render json: reservations	
	end

	def preview
		start_date = Date.parse(params[:start_date])
		end_date = Date.parse(params[:end_date])

		output = {
			conflict: is_conflict(start_date, end_date)
		}

		render json: output
	end

	def create
		
	
		if is_user_same_menu
			@reservation = current_user.reservations.create(reservation_params)	
			redirect_to @reservation.reservable, notice: "Reserva criada com sucesso..."
		else
			redirect_to this_room, :notice => "Este local de evento, pertence a você..."
		end
	end

	def your_trips
		@trips = current_user.reservations.where(reservable_type: 'Room')
	end

	def your_reservations
		@rooms = current_user.rooms
	end
	
	def this_room
		room = Room.find(params[:room_id])
	end

	private
		def is_conflict(start_date, end_date)
			room = Room.find(params[:room_id])

			check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
			check.size > 0? true : false
		end

		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :reservable_id, :reservable_type)
		end
		
		def is_user_same_room
			
			 !your_reservations.include?(this_room)
			
		end
end