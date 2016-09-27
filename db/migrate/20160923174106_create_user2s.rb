class CreateUser2s < ActiveRecord::Migration
  def change
    create_table :user2s do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :Description

      t.timestamps
    end
  end
end
