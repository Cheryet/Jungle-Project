require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is a valid entry with all field filled out" do 
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: 'Heryet',
          email: 'bino@example.ca', 
          password: "123456",
          password_confirmation: "123456"
        )
      expect(@user).to be_valid
    end

    it "is not valid without a first_name" do
    
      @user = 
        User.new(
          first_name: nil, 
          last_name: 'Heryet',
          email: 'bino@example.ca', 
          password: "123456",
          password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end

    it "is not valid without a last_name" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: nil,
          email: 'bino@example.ca', 
          password: "123456",
          password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end


    it "is not valid without a email" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: "Heryet",
          email: nil, 
          password: "123456",
          password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end


    it "is not valid without a password" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: nil,
          email: 'bino@example.ca', 
          password: nil,
          password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end

    it "is not valid without a password confirmation" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: nil,
          email: 'bino@example.ca', 
          password: "123456",
          password_confirmation: nil
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end

    it "is not valid without matching passwords" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: nil,
          email: 'bino@example.ca', 
          password: "654321",
          password_confirmation: "123456"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
    end

    it "is not valid with password less than required length" do
    
      @user = 
        User.new(
          first_name: "Bino", 
          last_name: nil,
          email: 'bino@example.ca', 
          password: "123",
          password_confirmation: "123"
        )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages)
      end

      it "is not valid without a unique email" do
    
        @user = 
          User.new(
            first_name: "Bino", 
            last_name: "Heryet",
            email: 'bino@example.ca', 
            password: "123456",
            password_confirmation: "123456"
          )
        @user1 = 
          User.new(
            first_name: "Corbin", 
            last_name: "Heryet",
            email: 'BINO@example.ca', 
            password: "123456",
            password_confirmation: "123456"
          )
        
          @user.save
          @user1.save
        expect(@user).to be_valid
        expect(@user1).to_not be_valid
        expect(@user.errors.full_messages)
      end
  
  end

  describe '.authenticate_with_credentials' do
    it "authenticates when credentials are valid" do
          @user = 
          User.new(
            first_name: "Bino", 
            last_name: "Heryet",
            email: 'bino@example.ca', 
            password: "123456",
            password_confirmation: "123456")
      @user.save!
      auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(auth).to eq @user
    end
    it "doesn't authenticate when email is incorrect" do
      @user = 
          User.new(
            first_name: "Bino", 
            last_name: "Heryet",
            email: 'bino@example.ca', 
            password: "123456",
            password_confirmation: "123456")
      @user.save!
      auth = User.authenticate_with_credentials("other@gmail.com", @user.password)
      expect(auth).to eq nil
    end

    it "doesn't authenticate when password is incorrect" do
      @user = 
          User.new(
            first_name: "Bino", 
            last_name: "Heryet",
            email: 'bino@example.ca', 
            password: "123456",
            password_confirmation: "123456")
      @user.save!
      auth = User.authenticate_with_credentials(@user.email, "forgot")
      expect(auth).to eq nil
    end

    it "authenticates when email is correct but contains whitespace around it" do
      @user = 
          User.new(
            first_name: "Bino", 
            last_name: "Heryet",
            email: 'bino@example.ca', 
            password: "123456",
            password_confirmation: "123456")
      @user.save!
      auth = User.authenticate_with_credentials("   " + @user.email + "  ", @user.password)
      expect(auth).to eq @user
    end

    it "authenticates when email is correct but in the wrong case" do
      @user = 
      User.new(
        first_name: "Bino", 
        last_name: "Heryet",
        email: 'bino@example.ca', 
        password: "123456",
        password_confirmation: "123456")
      @user.save!
      auth = User.authenticate_with_credentials("BiNo@ExAmPlE.CA", @user.password)
      expect(auth).to eq @user
    end

  end





end
