class CreateNetworkings < ActiveRecord::Migration
  def change
    create_table :networkings do |t|
      t.integer :user_id
      t.integer :network_connection_id
      t.string :status

      t.timestamps
    end
  end
end
