class CreateStyles < ActiveRecord::Migration
  def change
    rename_column :beers, :style, :style_old
    add_column :beers, :style_id, :integer
    create_table :styles do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
