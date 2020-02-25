class AddReferenceToOrder < ActiveRecord::Migration[6.0]
  def change
  	add_reference :orders, :location, foreign_key: true, null: true
  end
end
