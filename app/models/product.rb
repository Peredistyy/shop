class Product < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 1 }

  has_attached_file :image, styles: { medium: '300x300>', thumb: '50x50>' }, default_url: '/images/product/:style.jpg'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
