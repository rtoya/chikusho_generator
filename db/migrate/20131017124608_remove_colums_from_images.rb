class RemoveColumsFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :output_file_name, :string
    remove_column :images, :output_content_type, :string
    remove_column :images, :output_file_size, :integer
  end
end
