class AddRandomHashToImages < ActiveRecord::Migration
  def change
    add_column :images, :random_hash, :string
  end
end
