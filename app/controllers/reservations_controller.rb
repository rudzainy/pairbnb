class ReservationsController < ApplicationController
  def create
  	if !current_user.nil?
	  	@listing = Listing.find(params[:listing_id])
	  	@reservation = Reservation.new
	  	reservation = Reservation.new(reservation_params)
	  	reservation.user_id = current_user.id
	  	reservation.listing_id = params[:listing_id]
	  	if reservation.save
	  		ReservationJob.perform_later(current_user, @listing.user, reservation.id)
		  	redirect_to @listing, notice: "Success!"
		  else
			  redirect_to @listing, notice: "Unable to book a reservation."
			end
		else
			redirect_to sign_in_path, notice: "Please sign in to continue."
		end
  end

  def destroy
  	reservation = Reservation.find(params[:id])
  	reservation.destroy
  	redirect_to listings_path
  end

private
	
		def reservation_params
			params.require(:reservation).permit(:checkin, :checkout)
		end
end
