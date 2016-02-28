class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean

    users = User.all
    users.map{|u| u.update_attribute(:admin, false); u.save}
  end
end
