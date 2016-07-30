class CreateJoinTableAilmentsSpecialties < ActiveRecord::Migration
  def change
    create_join_table :ailments, :specialties do |t|
      t.index [:ailment_id, :specialty_id]
      t.index [:specialty_id, :ailment_id]
    end
  end
end
