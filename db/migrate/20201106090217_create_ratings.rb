class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :content
      t.integer :score

      t.timestamps
    end
  end
end
