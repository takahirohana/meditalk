class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :cc,        null: false
      t.string :from_when,  null: false
      t.string :where,      null: false
      t.string :situation,  null: false
      t.string :ph,         null: false
      t.string :allergies,  null: false
      t.string :medicine,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end