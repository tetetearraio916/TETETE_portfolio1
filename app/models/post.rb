class Post < ApplicationRecord
  has_many :answers
  has_one_attached :image
  default_scope->{order(created_at: :desc)}
  validates:title,presence:true,length:{maximum:50}
  validates:content,presence:true,length:{maximum:140}
  validates:image, content_type:{in:%w[image/jpeg image/gif image/png],
                    message:"must be avalid image formaat"},
            size:{less_than:5.megabytes,
                    message:"should be less than 5MB"}
                    
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
                    
end
