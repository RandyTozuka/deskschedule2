class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :idnum,  :integer
    add_column :users, :dep,    :string
  end
end
