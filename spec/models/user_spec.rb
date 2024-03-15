require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for user model' do
    it 'is valid with valid attributes' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password', name: 'Test', )
      expect(@user).to be_valid
    end

    it 'is not valid without a password' do
      @user = User.new(email: 'test@test.com', password: nil, password_confirmation: 'password', name: 'Test', )
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid if password does not match password confirmation' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'different', name: 'Test', )
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'requires a unique email' do
      User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', name: 'Test', )
      @user2 = User.new(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password', name: 'Test2',)
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    # it 'is not valid without an email' do
    #   @user = User.new(email: nil, password: 'password', password_confirmation: 'password', name: 'Test', )
    #   expect(@user).not_to be_valid
    #   expect(@user.errors.full_messages).to include("Email can't be blank")
    # end

    # it 'is not valid without a first name' do
    #   @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password', name: nil, )
    #   expect(@user).not_to be_valid
    #   expect(@user.errors.full_messages).to include("First name can't be blank")
    # end

    # it 'is not valid without a last name' do
    #   @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password', name: 'Test')
    #   expect(@user).not_to be_valid
    #   expect(@user.errors.full_messages).to include("Last name can't be blank")
    # end
  end
end
