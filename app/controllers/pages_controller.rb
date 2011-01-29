class PagesController < ApplicationController
	before_filter :require_admin, :only => :admin

  def home
		@title = "Home"
		@events = Event.all
		@contributions = Contribution.all
  end

  def help
		@title = "Help"
  end

  def about
		@title = "About"
  end

  def admin
		@title = "Admin"
  end

end
