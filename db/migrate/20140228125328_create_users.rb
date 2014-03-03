class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :api_key

      t.timestamps
    end
  end
end
