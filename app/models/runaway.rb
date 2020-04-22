class Runaway < ApplicationRecord
  validates :name, presence: true

  has_many :aircrafts
end
