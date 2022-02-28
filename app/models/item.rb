class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre
  has_many :cart_items
  
  validates :image_id, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :name, presence: true
  validates :genre_id, presence: true
  
  def get_image(width, height)
    if image_id.attached?
      image_id.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  
end
