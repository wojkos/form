class User < ApplicationRecord
  has_one :address

  validates_uniqueness_of :email
  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
