class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre
  # belongs_to :order
  has_many :cart_items
  has_many :order_details
  
  validates :image_id, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :name, presence: true
  validates :genre_id, presence: true
  
  def get_image(width, height)
    unless image_id.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image_id.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    pp image_id
    image_id.variant(resize_to_limit: [width, height]).processed
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal(cart_item)
    with_tax_price * cart_item.amount
  end
  
end
