class Review < ActiveRecord::Base
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
end
