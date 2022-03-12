class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait: 0, payment_confirmation: 1, making: 2, preparation: 3, sent: 4}
end




