class AddNewBookTableColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :gender, :string
    add_column :books, :cost, :decimal, precision: 10, scale: 2
    add_column :books, :observations, :string
  end
end
