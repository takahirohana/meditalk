class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name,        null: false
      t.string :area,        null: false
      t.string :speciality,  null: false
      t.string :word,        null: false

      t.timestamps
    end
  end
end