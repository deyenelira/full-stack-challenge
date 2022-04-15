require 'rails_helper'

RSpec.describe Book, :type => :model do
  
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'title'
    subject.author = 'author'
    expect(subject).to be_valid
  end

  it 'is invalid with invalid attributes' do
    subject.name = ''
    subject.author = 'author'
    expect(subject).to_not be_valid
  end

  it 'is invalid with invalid attributes' do
    subject.name = 'title'
    subject.author = ''
    expect(subject).to_not be_valid
  end

  it 'is invalid without an unique name' do 
    b = FactoryBot.create(:book)
    subject.name = b.name
    subject.author = 'author'
    expect(subject).to_not be_valid
  end
end
