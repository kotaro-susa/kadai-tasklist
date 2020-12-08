class AddStatusToTasklist2s < ActiveRecord::Migration[5.2]
  def change
    add_column :tasklist2s, :status, :string
  end
end
