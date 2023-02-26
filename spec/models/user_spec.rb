require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    User.new(first_name: "Yash", last_name: "Budukh")
  }

  it 'is invalid without valid first_name and last name' do
    subject.first_name = nil
    subject.last_name = nil
    expect(subject).to be_invalid
  end

  it 'is invalid without valid first_name ' do
    subject.first_name = nil
    expect(subject).to be_invalid
  end

  it 'is invalid without valid last_name ' do
    subject.last_name = nil
    expect(subject).to be_invalid
  end

  it 'is valid without with first_name and last_name ' do
    expect(subject).to be_valid
  end

end
