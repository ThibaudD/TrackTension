class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.float :systolic
      t.float :diastolic
      t.float :pulse
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :measures, [:user_id, :created_at]
  end
end
