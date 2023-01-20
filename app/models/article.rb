class Article < ApplicationRecord
  include Visible

  has_many :comments
  belongs_to :user, touch: true

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
