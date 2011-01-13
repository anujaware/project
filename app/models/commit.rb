class Commit < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
  validates_presence_of :sha

  after_create :create_author_repository
#  before_destroy :find_author_repositoy

  def create_author_repository
    if(AuthorRepository.where(:author => author , :repository => repository).empty?)
      AuthorRepository.create(:author => author , :repository => repository)
    end
  end

 # def find_author_repository
  #  if(Commit.where(:author => author , :repository => repository).count <= 1)
   #   AuthorRepository.where(:author => author , :repository => repository).destroy
    #end
  #end
end

