class AddDataColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :output_data, :binary
  end
end
