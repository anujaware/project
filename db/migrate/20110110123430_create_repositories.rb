class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.string :repository_type
      t.string :path
      t.string :log_file

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
