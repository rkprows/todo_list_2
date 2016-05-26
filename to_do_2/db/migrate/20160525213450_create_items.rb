class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :complete
      t.belongs_to :list

      t.timestamps null: false
    end
  end
end
