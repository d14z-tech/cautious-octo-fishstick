class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :books

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_confirmation, presence: true, if: Proc.new { |user| user.password.blank? && user.password_digest.blank? }
end
