class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :pub_number,
        :copy_number,
        :work_center,
        :pub_type,
        :classification,
        :title
      t.datetime :issue_date, :last_audit_date
      t.timestamps
    end
  end
end
