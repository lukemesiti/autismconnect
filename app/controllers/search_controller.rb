class SearchController < ApplicationController


	def index

		def index
      #if there's a user logged in and they hit 'my listings', filter by their listings....
      if @user.present? 
        @listings = @user.listings
      else
        @listings = Listing.all
      end
      all_listing_count = @listings.count
    

      #the user comes here if they use the search function...
      if params[:search_term].present?
        search_term = "%#{params[:search_term]}%"
        @listings = @listings.where("name ilike ?", search_term)
        # if @listings == nil
        # render text: "" 
        # end
        search_count = @listings.count


      end

      if params[:suburb].present?
        search_term = "%#{params[:suburb]}%"
        @listings = @listings.where("location ilike ?", search_term)
      end
      final_count = @listings.count


      if final_count == 0

        flash.now.notice = "There aren't any listings that match '#{h params[:search_term]}' and '#{h params[:suburb]}'. <a href='/'>Try some different search terms</a> or check out <a href='/listings'>All Listings</a> instead. ".html_safe
      
        if search_count != 0 && params[:search_term].present?
          flash.now.notice = "There aren't any listings that match '#{h params[:search_term]}' and '#{h params[:suburb]}' specifically. There are <a href='/listings?utf8=✓&search_term=#{params[:search_term]}&suburb=&commit=Forage'>#{search_count} listings for just '#{h params[:search_term]}'</a> though! <a href='/'>Try some different search terms</a> or check out <a href='/listings'>All Listings</a> instead. ".html_safe
        end

      else 
        
      end

      # functions to sort by name or location....
      @sort = params[:sort] || :name
      @sort_by = params[:sort_by].try(:to_sym) || :asc
      @listings = @listings.order(@sort => @sort_by)

      #functions to filter by transaction type...

      if params[:filter].present?
      filter_type = "#{params[:filter]}"
      @listings = @listings.where("transaction_type = ?", filter_type)
      @listings_count = @listings.count 
        if @listings_count == 0
          flash.now.notice = "There currently aren\'t any listings to #{filter_type} right now. Try filtering by something else!"
        end
      end
  

	end



end
