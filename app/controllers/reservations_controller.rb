class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def preload
		event = Event.find(params[:event_id])
		today = Date.today
		reservations = event.reservations.where("start_date >= ? OR end_date >= ?", today, today)

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
		@reservation = current_user.reservations.create(reservation_params)

		redirect_to @reservation.event, notice: "Your reservation has been created..."
	end

	private
		def is_conflict(start_date, end_date)
			event = Event.find(params[:event_id])

			check = event.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
			check.size > 0? true : false
		end

		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :event_id)
		end
end