class RegistrationWhitelist < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  def self.add!(email)
    return if allowed?(email)
    create!(email: email)
  end

  def self.allowed?(email)
    where(email: email).any?
  end
end
