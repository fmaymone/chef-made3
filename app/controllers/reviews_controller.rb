class ReviewsController < ApplicationController

	def create
		@menu = Menu.find(params[:menu_id])

		puts @menu

		@review = @menu.reviews.create(review_params)
		redirect_to @menu
	end

	def destroy
		@menu = Menu.find(params[:menu_id])
		@review = Review.find(params[:id])

		@review.destroy

		redirect_to @menu
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :reviewable_id, :reviewable_type, :user_id)
		end
end