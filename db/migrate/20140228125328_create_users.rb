class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :api_key
      t.string :client_ip

      t.timestamps
    end
  end
end
