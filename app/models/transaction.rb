class Transaction < ApplicationRecord
  belongs_to :customer
  has_many :invoices

  scope :successful, -> {where(results: "success")}
end
