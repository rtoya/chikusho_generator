class ChangeColumnPublicFlgForImages < ActiveRecord::Migration
  def change
    change_column :images, :public_flg, :boolean, default: true
  end
end
