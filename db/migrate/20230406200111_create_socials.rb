class CreateSocials < ActiveRecord::Migration[7.0]
  def change
    create_table :socials, id: :uuid do |t|
      t.string :name
      t.string :url
      t.string :icon
      t.references :user, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
