class Answer < ApplicationRecord
  belongs_to :post
  has_many_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :post_id,presence:true
  validates :name,presence:true,length:{maximum:50}
  validates :comment,presence:true,length:{maximum: 255}
  
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
