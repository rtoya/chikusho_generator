class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.boolean :public_flg
      t.string :input_file_name
      t.string :input_content_type
      t.integer :input_file_size

      t.timestamps
    end
  end
end
