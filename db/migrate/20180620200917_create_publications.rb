class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title, null: false
      t.text :description
      t.string :maintenance_level

      t.timestamps
    end
    add_index :publications, :title
  end
end
