class User < ApplicationRecord

  # #before_save { self.email = email.downcase if -> {email.present?} }
  # #before_save { self.email = email.downcase if email.present? }
  # #before_save { self.email = email.downcase if email.present? }
  # before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  
  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true


  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest?

  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 254 }

  has_secure_password
end
