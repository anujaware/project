class AuthorRepository < ActiveRecord::Base
	has_many :Authors
	has_many :Repositories
end
