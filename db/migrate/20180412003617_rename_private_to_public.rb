class RenamePrivateToPublic < ActiveRecord::Migration[5.1]
  def change
    rename_column :wikis, :private, :public
  end
end
