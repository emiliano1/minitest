class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :specialties, :name, unique: true
  end
end
