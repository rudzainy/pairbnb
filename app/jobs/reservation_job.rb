class ReservationJob < ActiveJob::Base
	queue_as :default

	def perform(customer, host, reservation_id)
		@listing = Reservation.find(reservation_id).listing
		@host = host
		@customer = customer
		ReservationMailer.booking_email(@customer, @host, reservation_id).deliver_now
	end
end