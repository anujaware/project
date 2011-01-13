class Repository < ActiveRecord::Base
        has_many :Authors
	has_many :Commits
	validates_presence_of :name 
	validates_presence_of :type
	validates_presence_of :path
end
