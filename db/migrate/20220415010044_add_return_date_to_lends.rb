class AddReturnDateToLends < ActiveRecord::Migration[6.1]
  def change
    add_column :lends, :return_date, :datetime
  end
end
