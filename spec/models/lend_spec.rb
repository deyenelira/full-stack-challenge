require 'rails_helper'

RSpec.describe Lend, :type => :model do
  
  book = FactoryBot.create(:book)
  user = FactoryBot.create(:user)
  subject { described_class.new(user_id: user.id, book_id: book.id, created_at: DateTime.now) }

  it 'is valid with valid attributes' do 
    subject.return_date = DateTime.now + 1.month
    expect(subject).to be_valid
  end

  it 'is invalid with an invalid return date' do 
    subject.return_date = DateTime.now + 6.month + 1.day
    expect(subject).to_not be_valid
  end

  it 'is invalid with an invalid return date' do 
    subject.return_date = DateTime.now - 1.day
    expect(subject).to_not be_valid
  end

  it 'is invalid with an invalid return date' do 
    subject.return_date = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with an invalid book' do 
    subject.return_date = DateTime.now + 1.month
    lend = FactoryBot.create(:lend)
    subject.book_id = lend.book_id
    expect(subject).to_not be_valid
  end 
end

