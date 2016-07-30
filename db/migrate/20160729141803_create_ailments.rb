class CreateAilments < ActiveRecord::Migration
  def change
    create_table :ailments do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :ailments, :name, unique: true
  end
end
