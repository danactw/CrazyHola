class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course

  after_create :serial_generator

  private
  def serial_generator
    # serial = "AAA #{Time.current.strftime("%Y%m%d")}#{id.to_s.rjust(7, '0')}"
    serial = "AAA #{Time.current.strftime("%Y%m%d")}#{code_generator(7)}"
    update(serial: serial)
  end

  def code_generator(n)
    all_chars = [*"A"..."Z", *"0"..."9"]
    confused_chars = ["1", "E", "O", "0"]
    (all_chars - confused_chars).sample(n).join
  end
end
