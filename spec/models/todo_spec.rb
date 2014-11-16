require 'rails_helper'

RSpec.describe Todo, :type => :model do
  context 'is invalid without' do
    subject { Todo.new }    
    it 'a user' do
      subject.title = 'Kodlar refactor edilecek.'
      expect(subject).to be_invalid
      subject.user = fake_user 
      expect(subject).to be_valid
    end

    it 'a title' do
      subject.title = nil
      subject.user = fake_user
      expect(subject).to be_invalid
    end

    def fake_user
      User.new(email: 'foo@example.com')
    end

  end
end
