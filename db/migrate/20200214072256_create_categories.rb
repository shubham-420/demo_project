class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :parent_category
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
