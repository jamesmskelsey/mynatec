class AddPubNumberToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :pub_number, :string
  end
end
