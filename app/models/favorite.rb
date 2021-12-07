class Favorite < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: :book_id}
  belongs_to :user
  belongs_to :book
end
