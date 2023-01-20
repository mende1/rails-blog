class User < ApplicationRecord
  before_save do
    self.email = email.downcase
  end

  has_many :articles

  validates :name, presence: true

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  validates :email,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
