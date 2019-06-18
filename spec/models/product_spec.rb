require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    subject {
      @category = Category.new(name: "test")
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
      expect(subject).to_not be_valid
    end

    it "is valid with valid price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
