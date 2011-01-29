class Requirement < ActiveRecord::Base
	belongs_to :event
	belongs_to :item

	validates_presence_of :item_id, :qty

	validates_numericality_of :qty, :only_integer => true, :message => "can only be whole number."
	validates_inclusion_of :qty, :in => 1..30, :message => "can only be between 1 and 30." 

end
