class AddLibraryIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :library_id, :int
  end
end
