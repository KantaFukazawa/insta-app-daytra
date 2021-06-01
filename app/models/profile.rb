class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :username, { presence: true, length: { minimum: 3, maximum: 10} }

end
