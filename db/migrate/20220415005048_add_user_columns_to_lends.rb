class AddUserColumnsToLends < ActiveRecord::Migration[6.1]
  def change
    add_reference :lends, :user, null: false, foreign_key: true
  end
end
