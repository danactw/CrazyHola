require "digest"
# Ruby中的標準函式庫會隨ruby一起出場，但是要用他的時候要require近來才能用

class User < ApplicationRecord
  validates :email, :username, presence: true

  has_many :courses
  has_many :orders

  has_many :favor_courses
  # has_many :courses, through: :favor_courses table名稱會和第6行一樣，所以這裡要改
  has_many :favorite_courses, source: :course, through: :favor_courses

  before_create :encrypt_password # 要存檔的時候才呼叫
  # callback、非同步
  # library:你呼叫他寫的程式碼(function)
  # framework:他呼叫你寫的程式碼(function)，通常有生命週期，在學框架就是在學要如何把東西放到對的地方


  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end

  # STEP 3 => keyword argument 
  # def self.login(email: , password:)

  #   salted_password = "xy#{password.reverse}hellohey"
  #   encryted_password = Digest::SHA1.hexdigest(salted_password)

  #   self.find_by(email: email, password: encryted_password)
  # end

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
    # 說明
    # self.password = Digest::SHA1.hexdigest(self.password)
    # => self.password= (Digest::SHA1.hexdigest(self.password))
    # 當我們開一個叫password的欄位時，rails model就會幫我們把每一個欄位都做一個getter＆setter
    # self.password = Digest::SHA1.hexdigest(password) => 可執行
    # password = Digest::SHA1.hexdigest(self.password) => 左邊的password變成一個區域變數
  end
end

