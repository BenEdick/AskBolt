class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end
end
