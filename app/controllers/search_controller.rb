class SearchController < ApplicationController
  include ERB::Util


	def index

		#@infos = Event.all + Article.all + Link.all + Document.all

      #the user comes here if they use the search function...
      if params[:search_term].present?
        search_term = "%#{params[:search_term]}%"
        #@infos = @infos.where("info[i].tags.[i] ilike ?", search_term)
        tag = Tag.where("name ilike ?", search_term).first
        if tag.present?
            @infos = tag.taggings
        #things = tag.taggables.search(search_term)
           @search_count = @infos.count
        else
          show_notice
        end
      else
         show_notice
       end

      

	end


def show_notice
  @infos = []
        @search_count = 0
        flash.now.notice = "There isn't anything on AutismConnect that match '#{h(params[:search_term])}'. Try some different search terms".html_safe if @search_count == 0
      end

end
