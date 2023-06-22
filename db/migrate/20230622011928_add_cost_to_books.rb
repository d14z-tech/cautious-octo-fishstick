class AddCostToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :cost, :decimal, default: 0, null: false, precision: 14, scale: 2
  end
end
