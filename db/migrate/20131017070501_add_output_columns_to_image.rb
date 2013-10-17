class AddOutputColumnsToImage < ActiveRecord::Migration
  def change
    add_column :images, :output_file_name, :string
    add_column :images, :output_content_type, :string
    add_column :images, :output_file_size, :integer
  end
end
