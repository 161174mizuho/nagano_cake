class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: { ng: 0, wait: 1, making: 2, completion: 3}
  def subtotal
    price * amount
  end
  def count
    item.amoun
  end
end
