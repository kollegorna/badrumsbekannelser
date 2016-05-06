class Comment < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :confession_id, uniqueness: true
end
