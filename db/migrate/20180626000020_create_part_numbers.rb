class CreatePartNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :part_numbers do |t|
      t.string :number
      t.string :niin
      t.integer :publication_id
      t.timestamps
    end
  end
end
