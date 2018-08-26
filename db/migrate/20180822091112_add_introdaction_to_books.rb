class AddIntrodactionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :introdaction, :text
  end
end
