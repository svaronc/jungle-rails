require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for user model' do
    it 'is valid with valid attributes' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password',
                       first_name: 'Test', last_name: 'Test')
      expect(@user).to be_valid
    end

    it 'is not valid without a password' do
      @user = User.new(email: 'test@test.com', password: nil, password_confirmation: 'password', first_name: 'Test',
                       last_name: 'Test')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid if password does not match password confirmation' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'different',
                       first_name: 'Test', last_name: 'Test')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'requires a unique email' do
      User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', first_name: 'Test',
                  last_name: 'Test')
      @user2 = User.new(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password',
                        first_name: 'Test2', last_name: 'Test')
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'is not valid without an email' do
      @user = User.new(email: nil, password: 'password', password_confirmation: 'password', first_name: 'Test',
                       last_name: 'Test')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a first first_name' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password', first_name: nil,
                       last_name: 'Test')
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without a last first_name' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password',
                       first_name: 'Test', last_name: nil)
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'The password must have a minimum length 6' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password',
                       first_name: 'Test', last_name: 'test')
      expect(@user).to be_valid
      expect(@user.password.size).to be >= 6
    end
  end
  describe '.authenticate_with_credentials' do
    it 'returns the user if the email and password match' do
      user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password',
                         first_name: 'Test', last_name: 'Test')
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'returns nil if the email does not exist' do
      authenticated_user = User.authenticate_with_credentials('nonexistent@test.com', 'password')
      expect(authenticated_user).to be_nil
    end

    it 'returns nil if the password is incorrect' do
      User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password',
                  first_name: 'Test', last_name: 'Test')
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'wrong_password')
      expect(authenticated_user).to be_nil
    end
  end
end
