class Location < ApplicationRecord
  validates :state, :country, :home, length: { minimum: 3 }
  belongs_to :user
end
