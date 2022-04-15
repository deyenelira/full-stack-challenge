class Lend < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validate :loan_date_is_valid?
  validate :return_date_is_valid?
  validate :user_is_valid?

  def loan_date_is_valid?
    if return_date < loan_date
      errors.add(:loan_date, "Loan date can not be more than return date")
    end
  end

  def return_date_is_valid?
    if return_date > (loan_date + 6.months)
      errors.add(:return_date, "Return date can not be more than 6 months from the loan date")
    end
  end

  def user_is_valid?
    lends_count = Lend.where(user_id: user_id, return_date: nil).count 
    if lends_count >= 2
      errors.add(:user_id, "This user can not borrow a book right now")
    end
  end
end
