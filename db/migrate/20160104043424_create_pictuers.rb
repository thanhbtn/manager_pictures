class CreatePictuers < ActiveRecord::Migration
  def change
    create_table :pictuers do |t|
      t.string :title
      t.string :description
      t.boolean :active, default: true
      t.references :album, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
