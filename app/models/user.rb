class User < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :email, uniqueness: true
  validates :email, :name, presence: true
  validates :email,
            format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
