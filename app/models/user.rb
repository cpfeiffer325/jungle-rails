class User < ActiveRecord::Base
  validates_presence_of :password_confirmation
  validates_length_of :password, minimum: 6
  has_secure_password

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
