class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index

        @listings = Listing.all

    end

    def new
        @listing = Listing.new
    end

    def create
        # to check for errors we will create an instance variable
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            render "new"
        else
             redirect_to listings_path
        end
    end

    def edit 
        #user can edit: only if the current user has created the listing
        # this line will do the work but will throw an error if the user didn't
        # create the listing
        # @listing = current_user.listings.find(params["id"])

        # this line will do the work and redirect us to the list of listings
        @listing = current_user.listings.find_by_id(params["id"])
        if @listing
            render ("edit")
        else
            redirect_to listings_path
        end
    end


    def update
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            @listing.update(listing_params)
            if @listing.errors.any?
                render "edit"
            else
            redirect_to listings_path
            end
        else
            redirect_to listings_path
        end
    end


    def show
        @listing = Listing.find(params["id"])
    end

    def destroy
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            @listing.destroy
        end
        redirect_to listings_path
    end

    private
    
    def listing_params
        #it saying that we're only going to accept those 4 params
        #different from listing.rb 
        params.require(:listing).permit(:title, :description, :price, :picture)
    end

end