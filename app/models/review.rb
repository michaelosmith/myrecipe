class Review < ActiveRecord::Base
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
  
  belongs_to :recipe
  belongs_to :chef
  
  default_scope -> { order(updated_at: :desc) }
  
end