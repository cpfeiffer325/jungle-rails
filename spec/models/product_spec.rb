require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    subject {
      @category = Category.new(name: "test")
      @category.save
      described_class.new(
        name: "Anything",
        price_cents: 100,
        quantity: 10,
        category: @category
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is valid with valid name" do
      subject.name = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "is valid with valid price" do
      subject.price_cents = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it "is valid with valid quantity" do
      subject.quantity = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is valid with valid category" do
      subject.category = nil
      subject.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end
