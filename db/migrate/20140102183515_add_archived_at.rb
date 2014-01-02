class AddArchivedAt < ActiveRecord::Migration
  def change
    add_column :sessions, :archived_at, :datetime
  end
end
