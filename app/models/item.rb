class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: "is out of setting range" },
                    format: { with: /\A\d+\z/, message: "Price is out of setting range" }

  validates :category_id, presence: true,numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 } 
  validates :charge_id, presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }   
  validates :leadtime_id, presence: true, numericality: { other_than: 1 } 
  
  belongs_to :user
  has_one_attached :image
  has_one :delivery, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :leadtime

  def sold_out?
  end
end