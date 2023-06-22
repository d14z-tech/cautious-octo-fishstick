class AddGenderToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :gender, :string
  end
end
