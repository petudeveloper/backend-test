class Product < ApplicationRecord
  belongs_to :store

  validates :codigo, presence: true
end
