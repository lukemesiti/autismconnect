class PagesController < ApplicationController
	# SP 24/02/2014 - don't need to authenticate for the home page or the about page!
	skip_before_action :authenticate_user!

	def home
    @events = Event.all.order('created_at DESC').limit(3)

    @articles = Article.all
    @article = Article.first
	end

	def about
	end



end
