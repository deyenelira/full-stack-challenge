require 'rails_helper'

RSpec.describe User, :type => :model do
  
  subject { described_class.new(email: 'test@gmail.com') }

  it 'is valid with valid attributes' do 
    subject.password = '123456'
    expect(subject).to be_valid
  end

  it 'is invalid with invalid password' do 
    subject.password = '12345'
    expect(subject).to_not be_valid
  end

  it 'is invalid without an unique email' do 
    u = FactoryBot.create(:user)
    subject.password = '123456'
    subject.email = u.email
    expect(subject).to_not be_valid
  end

  it 'is invalid with nil attributes' do 
    subject.password = ''
    subject.email = ''
    expect(subject).to_not be_valid
  end
end
