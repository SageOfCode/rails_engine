class Customer < ApplicationRecord
  validates_presence_of :name
  has_many :transactions, dependent: :destroy
end
