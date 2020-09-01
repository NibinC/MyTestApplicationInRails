class Subject < ApplicationRecord
has_many :page
	
	validates_presence_of :name
end
