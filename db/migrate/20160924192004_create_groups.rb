class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.integer :position

      t.timestamps null: false
    end

    add_index :groups, :name, unique: true
    add_index :groups, :slug, unique: true
  end
end
