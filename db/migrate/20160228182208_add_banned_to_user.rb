class AddBannedToUser < ActiveRecord::Migration
  def change
    add_column :users, :banned, :boolean

    users = User.all
    users.map{|u| u.update_attribute(:banned, false); u.save}
  end
end
