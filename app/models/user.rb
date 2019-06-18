class User < ActiveRecord::Base
  validates_presence_of :password_confirmation
  validates_length_of :password, minimum: 6
  has_secure_password

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
