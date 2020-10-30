class CreateRoomUserDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :room_user_doctors do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
