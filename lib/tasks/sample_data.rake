namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_categories
    make_items
		make_locations
    make_events
		make_requirements
		make_contributions
		make_admin
  end
end

def make_categories
  cat = Category.create!(:name => "Drink")
  cat = Category.create!(:name => "Food")
  cat = Category.create!(:name => "Supplies")
  cat = Category.create!(:name => "Other")
end

def make_items
  cat = Item.create!(:name => "Soft drink",
											:unit => "Bottle(s) 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Juice",
											:unit => "Bottle(s) 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Water - no gas",
											:unit => "Bottle(s) 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Water - with gas",
											:unit => "Bottle(s) 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Biscuits",
											:unit => "Packet(s)",
											:category_id => 2)
  cat = Item.create!(:name => "Cake",
											:unit => "Cake(s)",
											:category_id => 2)
  cat = Item.create!(:name => "Bread",
											:unit => "Loaves",
											:category_id => 2)
  cat = Item.create!(:name => "Crisps",
											:unit => "Packet(s)",
											:category_id => 2)
  cat = Item.create!(:name => "Fruit",
											:unit => "Bunch(es)",
											:category_id => 2)
  cat = Item.create!(:name => "Cups",
											:unit => "Packet(s)",
											:category_id => 3)
  cat = Item.create!(:name => "Plates",
											:unit => "Packet(s)",
											:category_id => 3)
  cat = Item.create!(:name => "Napkins",
											:unit => "Packet(s)",
											:category_id => 3)
end

def make_locations
  cat = Location.create!(:name => "Middle School")
  cat = Location.create!(:name => "Upper School")
  cat = Location.create!(:name => "Im Brandt, Thalwil")
end

def make_events
  cat = Event.create!(:name => "Winter Dance",
											:date => Time.now,
											:location_id => 1)
  cat = Event.create!(:name => "Ice Dance",
											:date => Time.now,
											:location_id => 3)
  cat = Event.create!(:name => "Spring Dance",
											:date => Time.now,
											:location_id => 2)
end

def make_requirements
  3.times do |e|
		12.times do |i|
    Requirement.create!(:qty => 1 + rand(12),
                 :event_id => 1 + e,
                 :item_id => 1 + i)
		end
  end
end

def make_contributions
  3.times do |e|
		6.times do |i|
    Contribution.create!(:qty => 1,
                 :event_id => 1 + e,
                 :item_id => 1 + rand(12),
								 :email => "Person#{rand(12)}")
		end
  end
end

def make_admin
	User.create! :username => 'admin', :email => 'mnelson@zis.ch', :password => 'foobar', :password_confirmation => 'foobar'
end  
