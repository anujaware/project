class Author < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
	has_many :commits, :dependent => :delete_all
	has_many :repositories, :through => :AuthorRepositories
	#validates_presence_of :name, :email
	validates_format_of :email, :with => /^[\w\.]+@[\w]+(\.[\w]+)+$/
end
