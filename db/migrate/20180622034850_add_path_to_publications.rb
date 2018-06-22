class AddPathToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :path, :string
  end
end
