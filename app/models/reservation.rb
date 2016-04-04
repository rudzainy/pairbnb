class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	def overlaps?(other_reservation)
    (self.checkin - other_reservation.checkout) * (other_reservation.checkin - self.checkout) >= 0
  end
end