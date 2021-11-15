require "digest"

class User < ApplicationRecord
  validates :username, presence: true
  # validates :email, presence: true, uniqueness: true, format: { :with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  # regular expression參考來源https://stackoverflow.com/questions/4776907/what-is-the-best-easy-way-to-validate-an-email-address-in-ruby
  
  before_create :encrypt_password

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end

end

