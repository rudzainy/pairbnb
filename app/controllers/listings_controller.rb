class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		if current_user
			@listing = Listing.new
		else
			redirect_to sign_in_path, notice: "Please sign in to continue."  and return
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing, notice: "Listing created."
		else
			render 'new'
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to @listing, notice: "Success!"
		else
			render 'edit'
		end
	end

	def destroy
    Listing.find(params[:id]).destroy
    flash[:success] = "Listing deleted"
    redirect_to listings_path
   end

	private

		def listing_params
			params.require(:listing).permit(:title, :home_type, :description, :home_type, :location, :guest, :bedroom, :price, :image)
		end
end