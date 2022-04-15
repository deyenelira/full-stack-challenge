class AddLoanDateToLends < ActiveRecord::Migration[6.1]
  def change
    add_column :lends, :loan_date, :datetime
  end
end
