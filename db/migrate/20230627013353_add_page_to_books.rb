class AddPageToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :page, :integer
  end
end
