class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :account, # i.e 31N2 0002A (wtf is with these account numbers anyways?)
        :maintenance_level,  #OID
        :uic,    # R21533
        :attn,  # Commanding Officer, it's for building an address
        :activity, # i.e. FRCNW, USS ESSEX
        :address,
        :city_state_zip,
        :poc_name, # AZ2 Whos Onfirst
        :poc_phone,
        :poc_email,
        :lead_ctpl,
        :alt_ctpl,
        :qa_monitor
      t.timestamps
    end
  end
end
