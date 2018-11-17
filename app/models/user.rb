class User < ApplicationRecord

  # #before_save { self.email = email.downcase if -> {email.present?} }
  # #before_save { self.email = email.downcase if email.present? }
  # #before_save { self.email = email.downcase if email.present? }
  # before_save { self.email = email.downcase }

  before_save { self.email = email.downcase if email.present? }
  before_save :format_name

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true


  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest?

  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 254 }

  has_secure_password

  def format_name
    if name
      name_array = []
      name.split.each do |name_part|
        name_array << name_part.capitalize
      end

      self.name = name_array.join(" ")
    end

end

end
