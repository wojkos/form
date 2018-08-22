class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.integer :street_name_number
      t.string :city
      t.references :user, foregin_key: true, index: true, null: false
      t.timestamps
    end
  end
end
