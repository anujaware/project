class Author < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	has_many :commits, :dependent => :delete_all
	has_many :repositories, :through => :AuthorRepositories
	#validates_presence_of :name, :email
	validates_format_of :email, :with => /^[\w\.]+@[\w]+(\.[\w]+)+$/
end
