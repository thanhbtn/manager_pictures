class CreateActives < ActiveRecord::Migration
  def change
    create_table :actives do |t|
      t.boolean :active_type, default: true
      t.references :active, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
