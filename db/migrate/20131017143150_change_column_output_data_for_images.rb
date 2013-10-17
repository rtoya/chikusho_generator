class ChangeColumnOutputDataForImages < ActiveRecord::Migration
  def change
    change_column :images, :output_data, :binary, limit: 10.megabyte
  end
end
