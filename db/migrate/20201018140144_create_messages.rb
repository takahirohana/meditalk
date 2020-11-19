class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text  :content
      t.references :room, foreign_key: true
      t.boolean :is_user
      t.timestamps
    end
  end
end

