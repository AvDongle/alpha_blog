class Article < ActiveRecord::Base
  belongs_to :user
  validates :title,:description, presence: true, length: {minimum: 3, maximum: 500}
  validates :user_id, presence: true 
end
