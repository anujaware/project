class CreateAuthorRepositories < ActiveRecord::Migration
  def self.up
    create_table :author_repositories do |t|
      t.string :author
      t.string :repository

      t.timestamps
    end
  end

  def self.down
    drop_table :author_repositories
  end
end
