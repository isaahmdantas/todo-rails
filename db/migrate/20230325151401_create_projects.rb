class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name
      t.string :color
      t.boolean :favorite, default: false
      t.string :view
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
