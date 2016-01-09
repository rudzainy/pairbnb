class ReservationsController < ApplicationController
  def create
  	if !current_user.nil?
	  	@listing = Listing.find(params[:listing_id])
	  	@reservation = Reservation.new
	  	reservation = Reservation.new(reservation_params)
	  	reservation.user_id = current_user.id
	  	if reservation.save
		  	redirect_to @listing, notice: "Success!"
		  else
			  redirect_to @listing, notice: "Unable to book a reservation"
			end
		else
			redirect_to sign_in_path, notice: "Please sign in to continue."
		end
  end

private
	
		def reservation_params
			params.require(:reservation).permit(:checkin, :checkout, :listing_id)
		end
end
