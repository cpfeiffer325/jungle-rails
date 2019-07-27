require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    subject{
      described_class.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "jdoe@email.com", 
        password: "test1234", 
        password_confirmation: "test1234"
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is valid with valid first name" do
      subject.first_name = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "is valid with valid last name" do
      subject.last_name = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it "is valid with valid email" do
      subject.email = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it "is valid with unique email" do
      subject.save
      subject2 = User.new(email: "Jdoe@email.com")
      subject2.save
      expect(subject2).to_not be_valid
      expect(subject2.errors.full_messages).to include("Email has already been taken")
    end

    it "is valid with valid password" do
      subject.password = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is valid with password_confirmation" do
      subject.password_confirmation = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should not be valid with a confirmation mismatch" do
      subject.password_confirmation = "nomatch"
      subject.save
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is valid with a password minimum length" do
      subject.password = "test"
      subject.save
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end   
  end

  describe ".authenticate_with_credentials" do
    subject{
      described_class.new(
        email: "jdoe@email.com", 
        password: "test1234", 
      )
    }

    it "is valid with authenticated email and password" do
      user = User.authenticate_with_credentials(subject.email, subject.password)
      # expect(subject.email).to eq(email)
    end
  end
end