class ContributionMailer < ActionMailer::Base
  
 def contribution_added_email(contribution)
  recipients current_user.email
	from "ZIS Events"
  subject "Contribution made to"
  sent_on Time.now
	#body {:url => "http://cold-window-955.heroku.com"} 
end
