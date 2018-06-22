class CreateExcerpts < ActiveRecord::Migration[5.2]
  def change
    create_table :excerpts do |t|
      t.integer :publication_id
      t.integer :page_number
      t.text :text
      t.timestamps
    end
  end
end
