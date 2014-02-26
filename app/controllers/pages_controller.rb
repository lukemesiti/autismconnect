class PagesController < ApplicationController
	# SP 24/02/2014 - don't need to authenticate for the home page or the about page!
	skip_before_action :authenticate_user!

	def home
    @events = Event.all.order('created_at DESC').limit(3)

    @articles = Article.all.order('created_at DESC').limit(3)
	end

	def about
	end

  def information
    @articles = Article.all
    @links = Link.all
    @documents = Document.all

    # to display 3 articles in carousel at a time
    @articles_sliced = @articles.each_slice(3)
  end


end
