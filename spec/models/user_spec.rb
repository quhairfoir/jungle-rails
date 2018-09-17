require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    
    # PASSWORD
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { should have_secure_password }
    it 'should have a password at least 6 characters long' do
      is_expected.to validate_length_of(:password).is_at_least(6)
    end
    
    #EMAIL
    it { is_expected.to validate_presence_of(:email) }
    it 'should not accept duplicate emails' do
      oldUser = User.create!(first_name: 'Some', last_name: 'Person', email: 'hey@hi.com', password: 'secret', password_confirmation: 'secret')
      newUser = User.new(first_name: 'Another', last_name: 'Person', email: 'hey@hi.com', password: 'secret', password_confirmation: 'secret')
      expect(newUser).not_to be_valid
      expect(newUser.errors.full_messages).to include("Email has already been taken")
    end
    it 'should allow valid email addesses' do
      is_expected.to allow_values('hello@hi.com', 'heya@hithere.ca', '  hello@hi.com').for(:email)
    end
    it 'should not allow invalid email addresses' do
      is_expected.not_to allow_values('hello.hi.com', 'hello@hi,com', 'hey', '').for(:email)
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.create(first_name: 'A', last_name: 'B', email: 'heya@hithere.com', password: 'supersecret', password_confirmation: 'supersecret')
    end

    it { is_expected.to be_truthy}

    it 'should return nil with invalid email' do
      expect(User.authenticate_with_credentials('heya@hellothere.com', 'supersecret')).to be_nil
    end

    it 'should return nil with wrong password' do
      expect(User.authenticate_with_credentials('heya@hithere.com', 'SUPERSECRET')).to be_nil
    end

  end
end
