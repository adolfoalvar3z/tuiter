class Tuit < ApplicationRecord
  validates :description, :username, presence: true

end
