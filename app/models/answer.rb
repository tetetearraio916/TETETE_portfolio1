class Answer < ApplicationRecord
  belongs_to :post
  validates :post_id,presence:true
  validates :name,presence:true,length:{maximum:50}
  validates :content,presence:true,length:{maximum: 140}
end
