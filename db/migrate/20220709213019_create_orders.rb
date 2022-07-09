class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.reference :buyer
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
