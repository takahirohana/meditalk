class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end