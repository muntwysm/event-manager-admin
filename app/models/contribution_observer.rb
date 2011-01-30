class ContributionObserver < ActiveRecord::Observer
 def after_create(contribution)
  ContributionMailer.contribution_added_email(contribution)
 end
end 
