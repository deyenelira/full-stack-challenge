class Lend < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validate :date_is_valid?
  validate :user_is_valid?
  validate :book_is_valid?

  def date_is_valid?
    if return_date.nil?
      errors.add(:return_date, "can not be blank")
    elsif return_date < DateTime.now
      errors.add(:return_date, "can not be less than borrow date")
    elsif return_date > (DateTime.now + 6.months)
      errors.add(:return_date, "can not be more than 6 months from the loan date")
    end
  end

  def user_is_valid?
    unless user_id.nil?
    return if Lend.find_by(id: id)
     lends_count = Lend.where(user_id: user_id).count 
      if lends_count >= 2
        errors.add(:user_id, "can not borrow a book right now")
      end
    end
  end

  def book_is_valid?
    if Lend.find_by(book_id: book_id)&.id != id
      errors.add(:book_id, "this book has already been borrowed")
    end
  end
end
