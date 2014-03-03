class AddApiRpmToUser < ActiveRecord::Migration
  def change
    add_column :users, :api_rpm, :integer, default: 0
  end
end
