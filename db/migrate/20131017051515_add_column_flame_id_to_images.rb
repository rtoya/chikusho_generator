class AddColumnFlameIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :flame_id, :integer
  end
end
