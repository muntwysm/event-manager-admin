# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Event supplies application"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

	def short_version_of(date)
		date.strftime("%e-%b")
	end

	def short_date_time(date)
		date.strftime("%a %e-%b-%Y %H:%M")
	end

end
