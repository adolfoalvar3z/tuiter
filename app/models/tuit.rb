class Tuit < ApplicationRecord
  validates :description, :username, presence: true

    include PgSearch::Model
    pg_search_scope :search_full_text, against: [
      [:description, 'A'],
      [:username, 'B']
    ]

end
