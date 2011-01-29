class Contribution < ActiveRecord::Base
	belongs_to :event
	belongs_to :item

	validates_presence_of :item_id, :qty, :email

	validates_numericality_of :qty, :only_integer => true, :message => "can only be whole number."
	#validates_inclusion_of :qty, :in => 1..30, :message => "can only be between 1 and 30." 

	#validates_confirmation_of :email

	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates_format_of   :email, :with => EmailRegex

	default_scope :order => 'created_at DESC'

	def self.search(search)
		if search
		  find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

end
